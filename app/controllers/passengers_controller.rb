class PassengersController < ApplicationController

  before_action :find_passenger, only: [:show, :edit, :destroy, :update]



  def index
    @passengers = Passenger.order(:name).page params[:page]
  end

  def show
  end

  def new
    @passenger = Passenger.new
  end

  def create
    passenger = Passenger.new(passenger_params)

    if passenger.save
      redirect_to passengers_path
    end
  end

  def edit
  end

  def update
    @passenger.name = passenger_params[:name]
    @passenger.phone_number = passenger_params[:phone_number]

    if @passenger.save
      redirect_to passenger_path(@passenger.id)
    end
  end

  def destroy

    @passenger.trips.each do |trip|
      trip.destroy
    end

    @passenger.destroy
    redirect_to passengers_path
  end

  private
    def find_passenger
      @passenger = Passenger.find(params[:id])
    end
    def passenger_params
        params.require(:passenger).permit(:name, :phone_number)
    end
end
