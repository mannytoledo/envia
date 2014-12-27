require 'yaml'

module Envia
  module ConfigReader
    class Config
      #
      # Read in YAML config file
      # ---
      # bucket: 'bucketname'
      # credentials:
      #   aws_key_id: 'adsfadfadsfa'
      #   aws_secret_key: 'adsfasdfasd'
      #
      # OR
      #
      # credentials: 'default'

      def initialize
        @config ||= Psych.load_file('$HOME/.config/envia.yml')
      end

      def set_creds
        if @config['credentials']
          @creds = Aws::Credentials.new(@config['credentials']['aws_key_id'],
                                        @config['credentials']['aws_secret_key'])
        else
          @creds = Aws::SharedCredentials.new
        end
      end

      def client
        set_creds
        @client ||= Aws::S3::Client.new(region: 'us-east-1', credentials: @creds)
      end
    end
  end
end
