class Plane < ApplicationRecord
	has_many :trips
    
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :place_count, numericality: { greater_than: 0 }
end
