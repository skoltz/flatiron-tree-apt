require 'geocoder'
require 'pry'
require 'geocoder'
class HomeController < ApplicationController
	def search 
	
	end
	def search_fewer

	end

	def home 
		 user = Geocoder.coordinates(params['search'])
		 r = params['radius']
		 @e = Greenthumb.near(user, r)


		 binding.pry

		# green_json = File.read('greenthumb_community_garden.json')
		# green = JSON.parse(green_json)
		# 	some_garden = Geocoder.coordinates("#{green[0]['address']}, New York")
		# 	dist = Geocoder::Calculations.distance_between(user, some_garden)
		# binding.pry
		# array = []
		# Greenthumb.all.each_with_index do |garden, index|
		# 	d = Geocoder::Calculations.distance_between(["#{garden.longitude.to_f}".to_f, "#{garden.latitude.to_f}".to_f], user)
		# 	array << garden if d < 3
		# end
		# binding.pry


	end

	def trump
	end

end
