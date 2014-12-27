module Envia
  module Subcommands

    class Upload < Thor
      desc "upload FILE",
        "Upload file from local filesystem to default bucket"
      option :tags
      def upload( file )
        puts "Looks like you are trying to upload #{file} with tags #{options[:tag]}"
      end
    end

  end
end
