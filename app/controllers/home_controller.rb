require 'geocoder'
require 'pry'
require 'open-uri'
require 'geocoder'
require 'JSON'
require 'open-uri'
class HomeController < ApplicationController
	EARTH_RADIUS = 3956
	RADIANS_PER_DEGREE = 0.017453293
	
	def search 
	
	end
	def geo(lat1, lng1, lat2, lng2)
		if lat2 && lng2 
		    dlng = lng2 - lng1
		    dlat = lat2 - lat1

		    dlng_rad = dlng * RADIANS_PER_DEGREE
		    dlat_rad = dlat * RADIANS_PER_DEGREE

		    lat1_rad = lat1 * RADIANS_PER_DEGREE
		    lat2_rad = lat2 * RADIANS_PER_DEGREE

		    a = (Math.sin(dlat_rad/2))**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * (Math.sin(dlng_rad/2))**2
		    c = 2 * Math.atan2( Math.sqrt(a), Math.sqrt(1-a))

		    EARTH_RADIUS * c
		else 
			return 10000
		end
	end

	def donald(model)
		model.select { |e| geo(@lat_lng["lat"], @lat_lng["lng"], e.latitude, e.longitude) < @radius }
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
		@location = @lat_lng["lat"], @lat_lng["lng"]
		# binding.pry
		if params['radius'] == ""
			@radius = 1
		else
			@radius = params['radius'].to_i
		end

		@parks = donald(Park.all)
		@gardens = donald(Greenthumb.all)
		@wifi = donald(Wifi.all)
		@tracks = donald(RunningTrack.all)


		# our methods using geocode:
		# @parks = Park.near(location, radius)
		# session[:parks] = ''
		# @gardens = Greenthumb.near(location, radius)




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
