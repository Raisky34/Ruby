class Plane < ApplicationRecord
  has_many :trips
  has_one :airport
end
