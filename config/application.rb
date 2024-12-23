require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Grandline
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.view_component.preview_paths << "#{Rails.root}/app/components_previews/"

    config.before_configuration do
      file = Rails.root.join("config", "secrets", "#{Rails.env}.json")
      raise "Missing decrypted secrets file #{file}" unless file.exist?

      secrets = JSON.parse(file.read, symbolize_names: true)

      # keep compatibility with ActiveSupport::EncryptedConfiguration
      def deep_transform(hash)
        return hash unless hash.is_a?(Hash)

        h = ActiveSupport::InheritableOptions.new
        hash.each do |k, v|
          h[k] = deep_transform(v)
        end
        h
      end

      Rails.application.credentials.deep_merge!(deep_transform(secrets))
    end
  end
end
