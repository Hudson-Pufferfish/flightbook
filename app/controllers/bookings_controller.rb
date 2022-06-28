class BookingsController < ApplicationController
  def index
  end

  def new
    @booking = Booking.new
    params[:tickets].to_i.times { @booking.passengers.build }
    @flight = Flight.find(params[:flight_id])

    render :new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      flash[:notice] = "Flight #{@booking.flight.formatted_flight_number} successfully booked! A confirmation email has been sent to each passenger."
      redirect_to booking_path(@booking.confirmation)
    else
      @flight = Flight.find(params[:booking][:flight_id])
      render :new


    end


  end

  def show
    @booking = Booking.find_by(confirmation: params[:id])
    if @booking
      render :show
    else
      flash[:alert] = 'Sorry, the booking you\'re looking for does not exist.'
      redirect_to root_path
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:confirmation, :flight_id, passengers_attributes: [:id, :name, :email])
  end
end

