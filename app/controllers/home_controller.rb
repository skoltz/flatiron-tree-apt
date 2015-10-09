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


		local_location = request.location 
		@user = params['search']
		if @user == ""
			if local_location.latitude == 0
				@user = "25 Chapel Street, Brooklyn, NY"
			else
				@user = local_location
			end
		end

		@lat_lng = JSON.parse(open("http://www.mapquestapi.com/geocoding/v1/address?key=awagdUn5fGclI4HKLxCsf1kiGYGptGQM&location=#{@user}").read)["results"][0]["locations"][0]["latLng"]
		location = @lat_lng["lat"], @lat_lng["lng"]
		
		if params['radius'] == ""
			radius = 1
		else
			radius = params['radius']
		end

		@parks = Park.near(location, radius)
		session[:parks] = ''
		@gardens = Greenthumb.near(location, radius)

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
