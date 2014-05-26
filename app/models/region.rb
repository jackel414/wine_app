class Region < ActiveRecord::Base
	belongs_to :province
	belongs_to :country

	validates_presence_of :country_id, :province_id, :name, :on => :create
	validates_presence_of :country_id, :province_id, :name, :on => :update
end