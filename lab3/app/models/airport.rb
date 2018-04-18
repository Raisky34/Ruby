class Airport < ApplicationRecord
  belongs_to :town

  has_one :country, :through :town

  has_many :trips_from, class_name: "Trip", foreign_key: "airport_from_id"
  has_many :trips_to, class_name: "Trip", foreign_key: "airport_to_id"

  validates :name, presence: true
  validates :place_count, numericality: { greater_than: 0 }
end
