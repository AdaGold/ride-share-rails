class HomepagesController < ApplicationController

  def index
    @drivers = Driver.all
    @passengers = Passenger.all
  end
end
