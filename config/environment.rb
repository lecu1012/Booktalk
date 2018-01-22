# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Amazon::Ecs.options = {
      associate_tag:     ENV['ASSOCIATETAG'],
      AWS_access_key_id: ENV['AWSACCESSKEYID'],
      AWS_secret_key:    ENV['AWSSECRETKEY']
}
