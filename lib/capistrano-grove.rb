require "capistrano-grove/version"
require "grove-rb"

module Capistrano
  module Grove

    class Client
      attr_accessor :grove_client

      def initialize(channel_key, options)
        @grove_client = ::Grove.new(channel_key, options)
      end

      def notify(message)
        !( @grove_client.post(message).status >= 400 )
      end
    end

  end
end
