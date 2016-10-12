require 'sinatra/base'
require 'sinatra/contrib/all'
require 'sinatra/asset_pipeline'
require 'slim'
require 'better_errors'
require 'i18n'
require 'i18n/backend/fallbacks'


class SinatraBasis < Sinatra::Base
  register Sinatra::Contrib
  register Sinatra::AssetPipeline

  configure :development do
    use BetterErrors::Middleware

    BetterErrors.application_root = File.expand_path('..', __FILE__)
  end

  configure do
    I18n::Backend::Simple.send(:include, I18n::Backend::Fallbacks)
    I18n.load_path = Dir[File.join(settings.root, 'locales', '*.yml')]
    I18n.backend.load_translations
  end

  helpers do
    def t(*args)
      # Just a simple alias, by [David T. Crosby](https://www.dafyddcrosby.com/using-i18n-in-sinatra/)
      I18n.t(*args)
    end
  end

  before '/:locale/*' do
    I18n.locale       =       params[:locale]
    request.path_info = '/' + params[:splat ][0]
  end

  get "/" do
    slim :index
  end

end