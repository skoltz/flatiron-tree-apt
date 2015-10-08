require 'geocoder'
require 'pry'
require 'open-uri'
require 'geocoder'
require 'JSON'
require 'open-uri'
class HomeController < ApplicationController
	def search 
	
	end
	def search_fewer

	end

	def home 


		lat_lng = JSON.parse(open("http://www.mapquestapi.com/geocoding/v1/address?key=awagdUn5fGclI4HKLxCsf1kiGYGptGQM&location=#{params[:search]}").read)["results"][0]["locations"][0]["latLng"]
		session[:latlng] = lat_lng["lat"], lat_lng["lng"]
		radius ||= params['radius']
		@parks = Park.near([lat_lng["lat"], lat_lng["lng"]], radius)
		@gardens = Greenthumb.near([lat_lng["lat"], lat_lng["lng"]], radius)

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
