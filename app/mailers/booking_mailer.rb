class BookingMailer < ApplicationMailer
  def new_booking_email
    @booking = params[:booking]
    mail(to: @booking.passengers.pluck(:email), subject: "Your booking flight from #{@booking.flight.origin.city} (#{@booking.flight.origin.code}) to #{@booking.flight.destination.city} (#{@booking.flight.destination.code}) has been confirmed! Confirmation code: #{@booking.confirmation}")
  end
end
