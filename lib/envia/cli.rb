require 'thor'
# require 'envia/subcommands/upload'
# require 'envia/subcommands/url_generator'

module Envia

  class CLI < Thor
    # desc "hello NAME", "This will greet you."
    # long_desc <<-HELLO_WORLD
    # `hello NAME` will print out a message to the person of your choosing.

    # Brian Kernighan actually wrote the first "Hello, World!" program
    # as part of the documentation for the BCPL programming language
    # developed by Martin Richards. BCPL was used while C was being
    # developed at Bell Labs a few years before the publication of
    # Kernighan and Ritchie's C book in 1972.

    # http://stackoverflow.com/a/12785204
    # HELLO_WORLD
    # option :upcase
    # def hello( name )
    #   greeting = "Hello, #{name}"
    #   greeting.upcase! if options[:upcase]
    #   puts greeting
    # end

    desc "share KEY", "Generate a url given an S3 object key."
    option :expiry, :default => 3600
    def share( prefix )
      config = Envia::ConfigReader::Config.new
      signer = Aws::S3::Presigner.new(Envia::ConfigReader::Config.client)
      signer.presigned_url(:get_object, bucket: config['bucket'], key: prefix, expires_in: options['expiry'].to_i)
    end

    # desc "upload FILE", "Hacker News Control Module"
    # subcommand "upload", Envia::Subcommands::Upload

    # desc "share S3_PREFIX", "Hacker News Control Module"
    # subcommand "share", Envia::Subcommands::Share
  end
end
