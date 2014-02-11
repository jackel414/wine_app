class Wine < ActiveRecord::Base
  belongs_to :user
  
  scope :cellared, where(stored: true)
  scope :cataloged, where(stored: false)
end
