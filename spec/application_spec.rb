require "#{File.dirname(__FILE__)}/spec_helper"

describe 'main application' do
  include Rack::Test::Methods

  def app
    SinatraBasis.new
  end

  it 'shows the default index page' do
    get '/'
    expect(last_response).to be_ok
  end
end