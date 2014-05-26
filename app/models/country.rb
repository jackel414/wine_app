class Country < ActiveRecord::Base
	has_many :provinces
	has_many :regions
	
	validates_presence_of :name, :on => :create
	validates_presence_of :name, :on => :update
end