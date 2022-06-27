class PagesController < ApplicationController
  def home
    # redirect_to blogs_path if logged_in?
    redirect_to flights_path
  end

  def about
  end
end
