require 'uri'
require 'net/http'
require 'openssl'
require 'json'

api_key = #<insert API KEY here>
url = URI('https://api.os.uk/features/ngd/ofa/v1/collections/bld-fts-buildingpart/items?bbox=0.0085,51.564,0.1166,51.6314&key='+ api_key)
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
request['accept'] = 'application/json'
response = http.request(request)

File.write('./ngd_pull.json',response.read_body)