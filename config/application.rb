require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Projektmappe
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    I18n.available_locales = [:de, :en]
    config.i18n.load_path += Dir[Rails.root.join('users', 'locales', '*.{rb,yml}').to_s]
    config.time_zone = 'Bern' # set default time zone to "Moscow" (UTC +4)
    config.i18n.default_locale = :de
  end
end
