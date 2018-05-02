class User < ApplicationRecord
  has_and_belongs_to_many :trips, polymorphic: true

  validates :first_name,
            :last_name,
            presence: true

  validates_format_of :email, with: /\A([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})\z/i

  validates :email, uniqueness: { case_sensitive: false }

  before_validation :normalize_fisrt_name,
                    :normalize_last_name,
                    :normalize_email,
                    on: :create

  private
  def normalize_fisrt_name
    self.first_name = first_name.downcase.titleize
  end

  def normalize_last_name
    self.last_name = last_name.downcase.titleize
  end

  def normalize_email
    self.email = email.downcase
  end
end
