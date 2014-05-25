class Province < ActiveRecord::Base
	has_many :regions
	belongs_to :country
end