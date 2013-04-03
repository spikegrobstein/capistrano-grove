require 'spec_helper'

describe Capistrano::Grove do

  let(:config) { Capistrano::Configuration.new }
  let(:client) { double('grove').as_null_object }

  before do
    Capistrano::Grove.load_into(config)
  end


  context "when notifying" do
    context "when failing to set grove_channel_token" do

      it "should raise an error" do
        expect { config.grove.notify }.to raise_error
      end

    end

    context "when grove_channel_token is set" do
      before do
        config.load do
          set :grove_channel_token, 'asdfasdfasdf'
        end
      end

      after do
        config.grove.notify 'msg'
      end

      it "should use :grove_channel_token" do
        new_channel_token = '12345678901234567890123456789012'
        config.set(:grove_channel_token, new_channel_token)

        client.stub(:notify => true)

        Capistrano::Grove::Client.should_receive(:new).with do |channel_token, options|
          channel_token.should == new_channel_token
        end.and_return(client)
      end

      it "should use :grove_service" do
        new_grove_service = 'testing-service'
        config.set(:grove_service, new_grove_service)

        client.stub(:notify => true)

        Capistrano::Grove::Client.should_receive(:new).with do |channel_token, options|
          options[:service].should == new_grove_service
        end.and_return(client)
      end

      it "should use :grove_icon_url" do
        new_grove_icon_url = 'http://example.com/testing/icon.png'
        config.set(:grove_icon_url, new_grove_icon_url)

        client.stub(:notify => true)

        Capistrano::Grove::Client.should_receive(:new).with do |channel_token, options|
          options[:icon_url].should == new_grove_icon_url
        end.and_return(client)
      end

      it "should use :grove_url" do
        new_grove_url = 'http://testing.com/capistrano-grove'
        config.set(:grove_url, new_grove_url)

        client.stub(:notify => true)

        Capistrano::Grove::Client.should_receive(:new).with do |channel_token, options|
          options[:url].should == new_grove_url
        end.and_return(client)
      end

    end

  end

end
