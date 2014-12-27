module Envia
  module Subcommands
    class Share < Thor
      desc "share KEY", "Generate a url given an S3 object key."
      option :expiry, :default => 3600
      def signer( prefix )
        config = Envia::ConfigReader::Config.new
        signer = Aws::S3::Presigner.new(Envia::ConfigReader::Config.client)
        signer.presigned_url(:get_object, bucket: config['bucket'], key: prefix, expires_in: options['expiry'].to_i)
      end
    end
  end
end
