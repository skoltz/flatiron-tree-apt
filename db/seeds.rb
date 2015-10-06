# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

green_json = JSON.parse('greenthunb_community_garden.json')
green_json.each do |garden|
	Greenthumb.create(address: garden[:address], size: garden[:size])
end
