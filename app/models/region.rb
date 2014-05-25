class Region < ActiveRecord::Base
	belongs_to :province
	belongs_to :country
end