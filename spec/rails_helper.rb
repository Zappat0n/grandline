require "spec_helper"
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?

require "rspec/rails"
# Add additional requires below this line. Rails is not loaded until this point!
require "capybara/rails"
require "capybara/rspec"
require "view_component/test_helpers"
require "view_component/system_test_helpers"
require "webmock/rspec"

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Rails.root.glob('spec/support/**/*.rb').sort_by(&:to_s).each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

Capybara.register_driver(:chrome_custom) do |app|
  capabilities = %w[
    disable-dev-shm-usage
    no-sandbox
    disable-software-rasterizer
    disable-background-networking
    disable-default-apps
    disable-extensions
    disable-sync
    disable-translate
    disable-features=VizDisplayCompositor
    metrics-recording-only
    ignore-certificate-errors
    disable-search-engine-choice-screen
  ]

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    clear_session_storage: true,
    clear_local_storage: true,
    options: Selenium::WebDriver::Chrome::Options.new(args: capabilities),
    )
end

Capybara.javascript_driver = :chrome_custom

Capybara.server = :puma
Capybara.server_port = 51_100

Capybara.configure do |config|
  config.test_id = "data-testid"
end

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.fixture_paths = [
    Rails.root.join('spec/fixtures')
  ]

  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::IntegrationHelpers, type: :feature
  config.include Devise::Test::ControllerHelpers, type: :view
  config.include FactoryBot::Syntax::Methods
  config.include ViewComponent::TestHelpers, type: :component
  config.include ViewComponent::SystemTestHelpers, type: :component
  config.include Capybara::RSpecMatchers, type: :component
end
