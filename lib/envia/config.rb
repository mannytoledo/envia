require 'yaml'

module Envia
  module ConfigReader
    class Config
      #
      # Read in YAML config file
      # ---
      # region: 'us-east-1'
      # bucket: 'bucketname'
      # credentials:
      #   aws_key_id: 'adsfadfadsfa'
      #   aws_secret_key: 'adsfasdfasd'
      #

      attr_accessor :config

      def initialize
        @config ||= Psych.load_file(config_file)
      end

      def set_creds
        @creds = nil
        if @config['credentials']
          @creds = Aws::Credentials.new(@config['credentials']['aws_key_id'],
                                        @config['credentials']['aws_key_secret'])
        end
      end

      def client
        set_creds
        if @creds
          @client ||= Aws::S3::Client.new(region: @config['region'], credentials: @creds)
        else
          @client ||= Aws::S3::Client.new(region: @config['region'])
        end
      end

      private
      def config_file
        if File.exist?(File.join(Dir.home,'.config/envia.yml'))
          File.join(Dir.home,'.config/envia.yml')
        else
          puts "Config does not exist! Please create one."
          puts "at #{Dir.home}/.config/envia.yml"
          exit 1
        end
      end

    end
  end
end
