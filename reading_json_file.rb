require 'json/pure'

file = File.read('ngd_pull.json')

ngd_pull_datahash = JSON.parse(file)

p ngd_pull_datahash["type"]
#this currently prints out FeatureCollection
p ngd_pull_datahash.keys
#this prints out all of the top level keys

ngd_pull_datahash.each do |k, v|
    p v if k == "timeStamp"
end
#this currently only loops through the first part of the data


