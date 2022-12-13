require 'sinatra'
require 'csv'


get '/' do
    @api_data = CSV.read("mock_data - Sheet1.csv")
    erb :index
end

