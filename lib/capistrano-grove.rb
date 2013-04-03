require "capistrano"
require "capistrano-grove/version"
require "capistrano-grove/client"
require "grove-rb"

module Capistrano
  module Grove

    def self.load_into(config)
      config.load do
        Capistrano.plugin :grove, Capistrano::Grove

        def _cset(name, *args, &block)
          unless exists?(name)
            set(name, *args, &block)
          end
        end

        # the channel's API key
        _cset(:grove_channel_key) { raise "Please set grove_channel_key!" }

        # the name of the service doing the posting
        _cset :grove_service, 'DeployBot'

        # url to the icon to use.
        _cset :grove_icon_url, nil

        # the url you want to use for your bot
        _cset :grove_url, nil

        # the message that gets posted.
        # set this before calling grove:notify to customize
        _cset(:grove_message) {
          "Successful deployment of #{ fetch(:application, 'application') }."
        }

      end
    end

    # send a notification to the grove service
    def notify(message=nil)
      g = Client.new(grove_channel_key,
        :service => grove_service,
        :icon_url => grove_icon_url,
        :url => grove_url
      )

      unless g.notify(message || fetch(:grove_message))
        # error
        logger.important "Failed to send notification to grove.io"
      end
    end

  end
end

if Capistrano::Configuration.instance
  Capistrano::Grove.load_into(Capistrano::Configuration.instance)
end
