class Plane < ApplicationRecord
  has_many :trips
  has_one :airport, through: :trips

  validates :name, presence: true
  before_validation :normalize_name, on: :create


  def free_seats
    return seats - trips.length
  end

  private
  def normalize_name
    self.name = name.downcase.titleize
  end
end
