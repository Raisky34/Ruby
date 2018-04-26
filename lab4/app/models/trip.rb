class Trip < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :plane
  belongs_to :airport_from, class_name: 'Airport', foreign_key: 'airport_from_id'
  belongs_to :airport_to, class_name: 'Airport', foreign_key: 'airport_to_id'

  scope :cheapest, -> { order(cost: :asc) }
  scope :nearest, -> { order(time_out: :asc) }
end
