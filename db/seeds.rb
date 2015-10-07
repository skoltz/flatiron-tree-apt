
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

green_json = File.read('greenthumb_community_garden.json')
green = JSON.parse(green_json)
green.each do |garden|
	Greenthumb.create(garden_name: garden['garden_name'], address: garden['address'], size: garden['size'])
end

file = Nokogiri::XML(File.open('park.txt'))
file.css('description').each_with_index do |e, index|
	Park.create(park: e.text.split('span')[-14].split('>')[1].gsub('</', ''), longitude: file.css('LookAt')[index+1].css('longitude').text.to_f, latitude: file.css('LookAt')[index+1].css('latitude').text.to_f)
end