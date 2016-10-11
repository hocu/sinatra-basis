require 'sinatra/base'
require 'sinatra/contrib/all'
require 'sinatra/asset_pipeline'
require 'slim'
require 'better_errors'


class SinatraBasis < Sinatra::Base
  register Sinatra::Contrib
  register Sinatra::AssetPipeline

  configure :development do
    use BetterErrors::Middleware

    BetterErrors.application_root = File.expand_path('..', __FILE__)
  end

  get "/" do
    slim :index
  end

end