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

describe 'Identify Correct Number of Columns in mock_data - Sheet1.csv' do
  it 'returns number of columns in mock_data - Sheet1.csv as 6' do
      expect(check_num_columns()).to eq(6)
  end
end

describe 'Function for website' do
  it 'returns 100 results' do
      expect(results_counter()).to eq(100)
  end
end
