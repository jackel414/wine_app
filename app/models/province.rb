class Province < ActiveRecord::Base
	has_many :regions
	belongs_to :country
	
	validates_presence_of :country_id, :name, :on => :create
	validates_presence_of :country_id, :name, :on => :update
end