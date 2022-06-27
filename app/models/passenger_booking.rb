# == Schema Information
#
# Table name: passenger_bookings
#
#  passenger_id :bigint           not null
#  booking_id   :bigint           not null
#
class PassengerBooking < ApplicationRecord
  belongs_to :passenger
  belongs_to :booking
end
