
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
	borough = "Brooklyn" if garden['boro'] == "B" 
	borough = "Queens" if garden['boro'] == "Q" 
	borough = "New York" if garden['boro'] == "M" 
	borough = "Bronx" if garden['boro'] == "X" 
	borough = "Staten Island" if garden['boro'] == "R" 

	Greenthumb.create(garden_name: garden['garden_name'], address: garden['address'], boro: borough, size: garden['size'])
end
