# == Schema Information
#
# Table name: passengers
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Passenger < ApplicationRecord
  before_save do
    self.email = email.downcase
    self.name = name.titleize
  end

  has_many :passenger_bookings, dependent: :destroy
  has_many :bookings, through: :passenger_bookings, inverse_of: :passengers
  has_many :flights, through: :bookings

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true,
                 length: { minimum: 2, maximum: 100 }
                 
  validates :email, if: -> { !email.blank? },
                length: { maximum: 105 },
                format: { with: VALID_EMAIL_REGEX }



  def formatted_name_long
    name.slice(0, 23).upcase
  end

  def formatted_name_short
    name.length < 16 ? name.upcase : name.slice(0, 18)
  end
end
