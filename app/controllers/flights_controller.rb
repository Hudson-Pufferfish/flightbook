
# rubocop:disable all

class FlightsController < ApplicationController
  def index
    @flights = Flight.includes(:origin, :destination).where(origin: params[:origin], destination: params[:destination], date: params[:date]).order(:time)
  end


end
