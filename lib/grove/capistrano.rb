require 'capistrano'
require 'capistrano-grove'

module Capistrano
  module Grove

    def self.load_into(config)
      config.load do
        set :grove_channel_key, '' # the channel's API key
        set :grove_service, 'DeployBot' # the name of the service posting
        set :grove_icon_url, nil # url to the icon to use.
        set :grove_url, nil # the url you want to use for your bot

        # the message that gets posted.
        # set this before calling grove:notify to customize
        set(:grove_message) {
          "Successful deployment of #{ fetch(:application, 'application') }."
        }

        on :load do
          after 'deploy', 'grove:notify'
        end


        namespace :grove do

          desc "Notify the grove.io service."
          task :notify do
            g = Client.new(grove_channel_key,
              :service => grove_service,
              :icon_url => grove_icon_url,
              :url => grove_url
            )

            unless g.notify(grove_message)
              # error
              logger.important "Failed to send notification to grove.io"
            end
          end
        end
      end
    end
  end
end

if Capistrano::Configuration.instance
  Capistrano::Grove.load_into(Capistrano::Configuration.instance)
end
