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

    it "should post the :grove_message" do

      Capistrano::Grove::Client.should_receive(:new).and_return(grove)
      grove.should_receive(:notify).with(config.fetch(:grove_message))

      config.find_and_execute_task('grove:notify')
    end

    it "should use :grove_channel_key"

    it "should use :grove_service"

    it "should use :grove_icon_url"

    it "should use :grove_url"

  end

end
