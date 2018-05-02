class Country < ApplicationRecord

  has_many :airports, dependent: :destroy

  validates_presence_of :name
  validates_length_of :name, maximum: 50

end
