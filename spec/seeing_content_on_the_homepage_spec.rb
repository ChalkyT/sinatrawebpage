require 'rack/test'
require_relative '../hello_world'

describe 'checking website is live' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "loads the home page" do
    get '/'
    expect(last_response).to be_ok
  end

  it "checks the HTTP status is 200" do
    get '/'
    expect(last_response.status).to eq(200)
  end
end

describe 'CSV data tests' do
  it 'returns number of columns in mock_data - Sheet1.csv as 6' do
      expect(check_num_columns()).to eq(6)
  end

  it 'returns a message if the file is less than 1000 rows' do
    expect(results_check()).to eq("This file has less than 1000 rows")
  end

  xit 'returns a message if the file has more than 1000 rows' do
    expect(results_check()).to eq("*ALERT* This file has more than 1000 rows")
  end

  it 'checks each row for same number of columns to equal 6' do
    expect(check_each_row_same_num_columns()).to eq("column number is always 6")
  end

  it 'checks each row for same number of columns and if not 6 returns error message' do
    expect(col_length_test("test,test,test")).to eq("*alert* there is a column number that is not 6")
  end
end

describe 'Output to website' do
  it 'returns the number of rows in the CSV file except for the header row' do
      expect(results_counter()).to eq(100)
  end

end
