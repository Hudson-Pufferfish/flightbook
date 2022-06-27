# == Schema Information
#
# Table name: flights
#
#  id             :bigint           not null, primary key
#  duration       :integer          not null
#  origin_id      :bigint           not null
#  destination_id :bigint           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  date           :date             not null
#  time           :time             not null
#  flight_number  :integer          default(-1), not null
#  rubocop:disable all

class Flight < ApplicationRecord

  belongs_to :origin, class_name: :Airport
  belongs_to :destination, class_name: :Airport
  has_many :bookings
  has_many :passengers, through: :bookings

  attr_accessor :tickets



  def formatted_date
    date.strftime("%m/%d/%Y")
  end

  def formatted_time
    time.strftime('%l:%M %P').upcase
  end

  def boarding_time
    (time - 1800).strftime('%l:%M %P').upcase
  end

  def formatted_duration
    "%dh%02dm" % duration.divmod(60)
  end

  def formatted_flight_number
    "FB#{flight_number}"
  end

end