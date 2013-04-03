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
        _cset(:grove_channel_key) { abort "Please set grove_channel_key!" }

        # the name of the service doing the posting
        _cset :grove_service, 'DeployBot'

        # url to the icon to use.
        _cset :grove_icon_url, nil

        # the url you want to use for your bot
        _cset :grove_url, nil

        # capnotify hooks
        on(:deploy_start) { grove.notify fetch(:capnotify_deploy_start_message) }
        on(:deploy_complete) { grove.notify fetch(:capnotify_deploy_complete_message) }
        on(:migrate_start) { grove.notify fetch(:capnotify_migrate_start_message) }
        on(:migrate_complete) { grove.notify fetch(:capnotify_migrate_complete_message) }
        on(:maintenance_page_up) { grove.notify fetch(:capnotify_maintenance_page_up_message) }
        on(:maintenance_page_down) { grove.notify fetch(:capnotify_maintenance_page_down_message) }

      end
    end

    # send a notification to the grove service
    def notify(message)
      g = Client.new(grove_channel_key,
        :service => grove_service,
        :icon_url => grove_icon_url,
        :url => grove_url
      )

      unless g.notify(message)
        # error
        logger.important "Failed to send notification to grove.io"
      end
    end

  end
end

if Capistrano::Configuration.instance
  Capistrano::Grove.load_into(Capistrano::Configuration.instance)
end
