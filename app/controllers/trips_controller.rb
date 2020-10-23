class TripsController < ApplicationController

  def show
    @trip = Trip.find_by(id: params[:id])
    if @trip.nil?
      head :not_found
      return
    end
  end

  def edit
    @trip = Trip.find_by(id: params[:id])
    if @trip.nil?
      head :not_found
      return
    end
  end
  
  #this method will make driver avalable after trip is complete
  def trip_complete
    @trip = Trip.find_by(id: params[:id])
    @driver = Driver.find_by(id: @trip.driver_id)
    if trip_params[:rating] != nil
      @driver[:available] = true
      @driver.save
    end
  end


  def update
    @trip = Trip.find_by(id: params[:id])
    if @trip.nil?
      head :not_found
      return
    elsif @trip.update(trip_params)
      trip_complete
      redirect_to trip_path(@trip.id)
      return
    else
      render :edit, status: :bad_request
      return
    end
  end

  def destroy
    @trip = Trip.find_by(id: params[:id])
    if @trip.nil?
      head :not_found
      return
    else
      @trip.destroy
      redirect_to passengers_path
    end
  end

  def create
    passenger_id = params[:passenger_id]
    rand_cost = rand(10..1000).to_f
    @driver = Driver.where(available: true).first

    if @driver.nil?
      redirect_to passenger_path(passenger_id)
      return
    end
    
    params_hash = {
      passenger_id: passenger_id,
      date: Date.today,
      cost: rand_cost,
      rating: nil,
      driver_id: @driver.id
    }

    @trip = Trip.new(params_hash)
    if @trip.save
      redirect_to trip_path(@trip.id)
      @driver.update(available: false)
      return
    else
      redirect_to passenger_path(passenger_id)
      return
    end
  end

  private
  def trip_params
    return params.require(:trip).permit(:date, :cost, :rating)
  end
end
