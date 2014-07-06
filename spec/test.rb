ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'rack/test'

require_relative '../sinatra-rocket.rb'
include Rack::Test::Methods

class SinatraRocketTest < MiniTest::Test
  def app
    Sinatra::Application
  end

  def loads
    get '/'
    assert last_response.ok?
  end

  def test_it_says_hello_world
    get '/'
    assert last_response.body.include? 'Hello, World!'
  end

  def test_it_has_info
    get '/info'
    assert last_response.body.include? "Information"
  end
end