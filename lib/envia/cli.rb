require_relative 'warnings'
require 'thor'
require 'aws-sdk-core'
# require 'pry'

module Envia

  class CLI < Thor

    desc "share KEY", "Generate a url given an S3 object key."
    option :expiry, :default => 3600
    def share( prefix )
      silence_warnings do
        source = ConfigReader::Config.new
        signer = Aws::S3::Presigner.new(client: source.client)
        url = signer.presigned_url(:get_object, bucket: source.config['bucket'], key: prefix, expires_in: options['expiry'].to_i)
        puts url
      end
    end

    desc "upload path/to/file", "Upload file from your machine to the defined bucket."
    def upload( filename )
      silence_warnings do
      source = ConfigReader::Config.new
      source.client.put_object(
        body: File.open( filename ),
        bucket: source.config['bucket'],
        key: File.basename(filename)
      )
      end
      puts 'SUCCESS!'
    end
  end
end
