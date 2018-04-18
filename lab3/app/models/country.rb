class Country < ApplicationRecord
	has_many :towns
	has_many :comments, as: :commentable  
	has_many :airports, through: :towns

	validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
