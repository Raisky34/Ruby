class Trip < ApplicationRecord
  belongs_to :plane
  belongs_to :airport_from, class_name: "Airport"
  belongs_to :airport_to, class_name: "Airport"

  has_and_belongs_to_many :users

  validate :out_after_int
  validates :start_date, :end_date, presence: true
end
