class Wine < ActiveRecord::Base
  belongs_to :user
  before_save :blank_fields, :bottles_left
    
  validates_presence_of :name, :grapes, :country, :wine_type, :on => :create
  validates_presence_of :name, :grapes, :country, :wine_type, :on => :update
  validates :price, numericality: true, :allow_blank => true
  validates :abv, numericality: true, :allow_blank => true
  
  scope :cellared, -> { where(stored: true) }
  scope :cataloged, -> { where(stored: false) }

  def blank_fields
  	if self.province == ''
  		self.province = nil
  	end
  	
  	if self.region == ''
  		self.region = nil
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

  def bottles_left
    if self.num_bottles == nil
      self.num_bottles = 0
    elsif self.stored == false && self.num_bottles != 0
      self.num_bottles = 0
    elsif self.stored == true && self.num_bottles == 0
      self.stored = false
      true
    end
  end

end