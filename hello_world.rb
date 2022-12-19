require 'sinatra'
require 'csv'

api_file = "mock_data_250 - Sheet1.csv"

get '/' do
    @height = @params[:height].nil? ? 18 : @params[:height]
    @ResultsCountNameTag = @params[:area_name].to_s.empty? ? "all properties" : @params[:area_name]
    
    name= @params[:area_name]

    @api_data = filter_data(@height, name, api_file)
    
    erb :index
end


def filter_data(height, name, api_file)
    
    datasheet = CSV.read(api_file)

    unless name.to_s.empty?
        datasheet.select!.with_index{|data,index| index == 0 || data[2].downcase == name.downcase} #passes us value and what the index is. Then checks if data equals our area name
    end

    unless height.to_s.empty?
        datasheet.select!.with_index{|data,index| index == 0 || data[5].to_f >= height.to_f} #passes us value and what the index is. Then checks if data equals our area name and keeps the index 0 for titles
    end
    
    return datasheet
end

# End of Krystian's Code


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