require_relative "test_helper"

class TestApp < Rulers::Application
end

class RulersAppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_request
    get "/"

    assert last_response.ok?
    assert last_response.body["Hello"]
    assert_equal "text/html", last_response.headers["Content-Type"]
  end
end