require 'uri'
require 'net/http'
require 'openssl'
require 'json'

api_key = #<insert API KEY here>

url_ngd = URI('https://api.os.uk/features/ngd/ofa/v1/collections/bld-fts-buildingpart/items?bbox=0.0085,51.564,0.1166,51.6314&key='+ api_key)
http = Net::HTTP.new(url_ngd.host, url_ngd.port)
http.use_ssl = true

request_ngd = Net::HTTP::Get.new(url_ngd)
request_ngd['accept'] = 'application/json'
response_ngd = http.request(request_ngd)

File.write('./ngd_pull.json',response_ngd.read_body)

url_places = URI("https://api.ordnancesurvey.co.uk/places/v1/addresses/bbox?format=JSON&maxresults=null&dataset=DPA%2C%20LPI&lr=EN%2C%20CY&fq=classification_code%3A%5Bcode%5D%2C%20LOGICAL_STATUS_CODE%3A%5Bcode%5D&output_srs=BNG%2C%20EPSG%3A27700%2C%20WGS84%2C%20EPSG%3A4326%2C%20EPSG%3A3857%2C%20EPSG%3A4258&srs=BNG%2C%20EPSG%3A27700%2C%20WGS84%2C%20EPSG%3A4326%2C%20EPSG%3A3857%2C%20EPSG%3A4258&key=INSERT_YOUR_API_KEY_HERE")

http = Net::HTTP.new(url_places.host, url_places.port)
http.use_ssl = true

request_places = Net::HTTP::Get.new(url_places)
request_places["accept"] = 'application/json'
response_places = http.request(request_places)

File.write('./places_pull.json',response_places.read_body)