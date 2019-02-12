require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"

Bundler.require(*Rails.groups)

module RailsBoilerplatePostgresql
  class Application < Rails::Application
    config.load_defaults 5.2

    config.i18n.default_locale = :'pt-BR'
    config.i18n.fallbacks = [:en]
    config.time_zone = 'Brasilia'

    config.api_only = true

    config.eager_load_paths << Rails.root.join('lib')
  end
end
