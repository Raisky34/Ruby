class Airport < ApplicationRecord

  belongs_to :country
  
  has_many :trips_from,
            class_name: 'Trip',
            foreign_key: 'airport_from_id'

  has_many :trips_to,
            class_name: 'Trip',
            foreign_key: 'airport_to_id'

  validates_presence_of :name
  validates_presence_of :city
  validates_presence_of :country_id

  validates_length_of :name, maximum: 50
  validates_length_of :city, maximum: 50

  def get_country_name
    return country.name
  end
end
