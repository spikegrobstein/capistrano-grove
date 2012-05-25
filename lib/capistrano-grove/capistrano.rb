require 'capistrano'
require 'grove-rb'

Capistrano::Configuration.instance.load do
  set :grove_channel_key, '' # the channel's API key
  set :grove_service, 'DeployBot' # the name of the service posting
  set :grove_icon_url, nil # url to the icon to use.
  set :grove_url, nil # the url you want to use for your bot

  # the message that gets posted.
  # set this before calling grove:notify to customize
  set(:grove_message) {
    "Successful deployment of #{ application }."
  }

  on :load do
    after 'deploy', 'grove:notify'
  end


  namespace :grove do

    desc "Notify the grove.io service."
    task :notify do
      g = Grove.new(grove_channel_key,
        :service => grove_service,
        :icon_url => grove_icon_url,
        :url => grove_url
      )

      response = g.post(grove_message)
      if response.status >= 400
        # error
        logger.important "Failed to send notification to grove.io"
      end
    end
  end
end
