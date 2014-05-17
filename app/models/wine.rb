class Wine < ActiveRecord::Base
  belongs_to :user
  
  attr_accessor :country_other, :region_other, :add_region_other, :add_region_2_other
  
  validates_presence_of :name, :grapes, :region, :country, :wine_type, :on => :create
  validates_presence_of :name, :grapes, :region, :country, :wine_type, :on => :update
  
  scope :cellared, where(stored: true)
  scope :cataloged, where(stored: false)
  
end