require 'sinatra'
require 'csv'


get '/' do
    @api_data = CSV.read("mock_data - Sheet1.csv")
    erb :index
end

def check_num_columns()
    CSV.open('./mock_data - Sheet1.csv', 'r') { |row| row.first.size}
end