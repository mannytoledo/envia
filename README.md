# Envia

Command line utility to upload files to S3 and get a url with a link to it.

## Installation

Just install the gem to your installation of ruby.

```ruby
gem install 'envia'
```

## Usage

There are two main functions bundled together in this tool. Each has its own subcommand.

```
envia upload <filename>
```

This command will push any file on your system up to your default S3 bucket.

```
envia share <prefix>
```

This command will return an S3 presigned URL that you can share with anyone to
download that file. Prsigned URLs let you set permissions and a period of time
for which the URL is valid.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/envia/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
