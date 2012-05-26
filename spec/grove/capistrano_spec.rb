require 'capistrano'
require 'grove-rb'

require File.dirname(__FILE__) + '/../../lib/capistrano-grove/capistrano'

describe Capistrano::Grove do

  let(:config) { Capistrano::Configuration.new }
  let(:grove) { double('grove').as_null_object }

  context "when notifying" do

    before do
      Capistrano::Grove.load_into(config)
    end

    after do
      config.find_and_execute_task('grove:notify')
    end

    it "should notify with the :grove_message" do
      Capistrano::Grove::Client.should_receive(:new).and_return(grove)

      grove.should_receive(:notify).with(config.fetch(:grove_message)).and_return(true)
    end

    it "should use :grove_channel_key" do
      new_channel_key = '12345678901234567890123456789012'
      config.set(:grove_channel_key, new_channel_key)

      grove.stub(:notify => true)

      Capistrano::Grove::Client.should_receive(:new).with do |channel_key, options|
        channel_key.should == new_channel_key
      end.and_return(grove)
    end

    it "should use :grove_service" do
      new_grove_service = 'testing-service'
      config.set(:grove_service, new_grove_service)

      grove.stub(:notify => true)

      Capistrano::Grove::Client.should_receive(:new).with do |channel_key, options|
        options[:service].should == new_grove_service
      end.and_return(grove)
    end

    it "should use :grove_icon_url" do
      new_grove_icon_url = 'http://example.com/testing/icon.png'
      config.set(:grove_icon_url, new_grove_icon_url)

      grove.stub(:notify => true)

      Capistrano::Grove::Client.should_receive(:new).with do |channel_key, options|
        options[:icon_url].should == new_grove_icon_url
      end.and_return(grove)
    end

    it "should use :grove_url" do
      new_grove_url = 'http://testing.com/capistrano-grove'
      config.set(:grove_url, new_grove_url)

      grove.stub(:notify => true)

      Capistrano::Grove::Client.should_receive(:new).with do |channel_key, options|
        options[:url].should == new_grove_url
      end.and_return(grove)
    end

  end

end
