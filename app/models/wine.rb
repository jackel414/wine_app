class Wine < ActiveRecord::Base
  belongs_to :user
  before_save :other_fields
  
  attr_accessor :country_other, :general_region_other, :specific_region_other, :micro_region_other
  
  validates_presence_of :name, :grapes, :general_region, :country, :wine_type, :on => :create
  validates_presence_of :name, :grapes, :general_region, :country, :wine_type, :on => :update
  
  scope :cellared, where(stored: true)
  scope :cataloged, where(stored: false)

  def other_fields
  	if self.country == 'Other'
	    self.country = self.country_other
	  end
	  
	  if self.general_region == 'Other'
	    self.general_region = self.general_region_other
	  end
	  
	  if self.specific_region == 'Other'
	    self.specific_region = self.specific_region_other
	  end
	  
	  if self.micro_region == 'Other'
	    self.micro_region = self.micro_region_other
	  end
  end
  
end