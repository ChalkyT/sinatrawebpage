require 'sinatra'
require 'csv'


get '/' do

    @api_data = CSV.read("mock_data - Sheet1.csv")
    @total_row_count = CSV.open('./mock_data - Sheet1.csv', 'r') { |row| row.count - 1}
    
    unless @params[:area_name].to_s.empty?
        @api_data.select!.with_index{|data,index| index == 0 || data[2].downcase == @params[:area_name].downcase}
    end

    erb :index

end

def check_num_columns()
    CSV.open('./mock_data - Sheet1.csv', 'r') { |row| row.first.size}
end

def results_counter()
    total_row_count = CSV.open('./mock_data - Sheet1.csv', 'r') { |row| row.count - 1}
end

def results_check()
    total_row_count = results_counter()
    if total_row_count < 1000
        "This file has less than 1000 rows"
    else
        "*ALERT* This file has more than 1000 rows"
    end
end

def check_each_row_same_num_columns()
    CSV.foreach("./mock_data - Sheet1.csv") do |row|
        col_length_test(row)
    end
"column number is always 6"
end

def col_length_test(row)
    if row.length != 6
        "*alert* there is a column number that is not 6"
    end
end