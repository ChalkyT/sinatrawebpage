require 'rack/test'
require_relative '../hello_world'

describe 'seeing content on the homepage' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "says hello" do
    get '/'
    expect(last_response).to be_ok
    #expect(last_response.body).to eq('hello world!')
  end
end