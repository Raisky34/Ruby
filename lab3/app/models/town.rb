class Town < ApplicationRecord
  belongs_to :country

  has_many :airports
  has_many :comments, as: :commentable  

  validates :name, presence: true
end
