class Wine < ActiveRecord::Base
	scope :cellared, where(stored: true)
	scope :cataloged, where(stored: false)
end
