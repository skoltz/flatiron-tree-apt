class Greenthumb < ActiveRecord::Base
	geocoded_by :full_address
	after_validation :geocode


	def full_address
		"#{self.address}, #{self.boro}, NY"
	end
end
