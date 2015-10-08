require 'geocoder'
require 'pry'

class HomeController < ApplicationController
	def search 
	
	end

	def home 
		user = Geocoder.coordinates(params['search'])

		green_json = File.read('greenthumb_community_garden.json')
		green = JSON.parse(green_json)
			some_garden = Geocoder.coordinates("#{green[0]['address']}, New York")
			dist = Geocoder::Calculations.distance_between(user, some_garden)
			binding.pry
	end

	def trump
	end

end
