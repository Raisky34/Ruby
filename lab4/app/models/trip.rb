class Trip < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :plane

  belongs_to :airport_from,
              class_name: 'Airport',
              foreign_key: 'airport_from_id'

  belongs_to :airport_to,
              class_name: 'Airport',
              foreign_key: 'airport_to_id'

  scope :cheapest, -> { order(cost: :asc) }
  scope :nearest, -> { order(time_out: :asc) }

  def plane_name
    return plane.name
  end

  def airport_from_name
    return airport_from.name
  end

  def airport_to_name
    return airport_to.name
  end

  def time_of_flight
    if time_in != nil && time_out != nil
      return ((time_in - time_out) * 60 / 1.hour).round
    end
    return 0
  end

  def get_trip_users
    return users.map { |user| user.full_name }.join(', ')
  end

end
