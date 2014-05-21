class Wine < ActiveRecord::Base
  belongs_to :user
  before_save :other_fields, :blank_fields
  
  attr_accessor :country_other, :general_region_other, :specific_region_other, :micro_region_other
  
  validates_presence_of :name, :grapes, :country, :wine_type, :on => :create
  validates_presence_of :name, :grapes, :country, :wine_type, :on => :update
  
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

  def blank_fields
  	if self.general_region == '' or self.general_region == 'None'
  		self.general_region = nil
  	end
  	
  	if self.specific_region == '' or self.specific_region == 'None'
  		self.specific_region = nil
  	end
  	
  	if self.micro_region == '' or self.micro_region == 'None'
  		self.micro_region = nil
  	end
  	
  	if self.winery == ''
  		self.winery = nil
  	end

  	if self.vintage == ''
  		self.vintage = nil
  	end

  	if self.purchase_date == ''
  		self.purchase_date = nil
  	end

  	if self.drink_date == ''
  		self.drink_date = nil
  	end

  	if self.meal == ''
  		self.meal = nil
  	end

  	if self.location == ''
  		self.location = nil
  	end

  	if self.notes == ''
  		self.notes = nil
  	end
  end
  
end