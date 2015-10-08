
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'open-uri'

green_json = File.read('greenthumb_community_garden.json')
green = JSON.parse(green_json)
green.each do |garden|
	borough = "Brooklyn" if garden['boro'] == "B" 
	borough = "Queens" if garden['boro'] == "Q" 
	borough = "New York" if garden['boro'] == "M" 
	borough = "Bronx" if garden['boro'] == "X" 
	borough = "Staten Island" if garden['boro'] == "R" 
	begin 
	finding_lat_long_json = JSON.parse(open("https://maps.googleapis.com/maps/api/geocode/json?address=#{garden["address"]},+NY&key=AIzaSyAep5zTHdPGQLHp6LCt8w72WOx1q1j-NU0").read)
	Greenthumb.create(garden_name: garden['garden_name'], address: garden['address'], boro: borough, size: garden['size'], latitude: finding_lat_long_json['results'][0]['geometry']['location']['lat'], longitude: finding_lat_long_json['results'][0]['geometry']['location']['lng'])
	rescue
		next
	end
end

file = Nokogiri::XML(File.open('park.txt'))
file.css('description').each_with_index do |e, index|
	Park.create(park: e.text.split('span')[-14].split('>')[1].gsub('</', ''), longitude: file.css('LookAt')[index+1].css('longitude').text.to_f, latitude: file.css('LookAt')[index+1].css('latitude').text.to_f)
end

