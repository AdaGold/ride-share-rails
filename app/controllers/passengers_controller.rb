class PassengersController < ApplicationController
  def index
    @passengers = Passenger.all
  end

  def show
    @passenger = Passenger.find_by(id: params[:id])

    if @passenger.nil?
      head :not_found
      return
    end
  end

  def new
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(passenger_params)

    if @passenger.save
      flash[:success] = "#{@passenger.name.capitalize} was successfully added!"
      redirect_to passenger_path(@passenger.id)
      return
    else
      flash.now[:error] = "#{@passenger && @passenger.name ? @passenger.name.capitalize : "passenger"} was NOT successfully added!"
      render :new, status: :bad_request
      return
    end
  end

  def edit
    @passenger = Passenger.find_by(id: params[:id])

    return head :not_found if @passenger.nil?
  end

  def update
    @passenger = Passenger.find_by(id: params[:id])
    return head :not_found if @passenger.nil?

    if @passenger.update(passenger_params)
      redirect_to passenger_path(@passenger.id)
      return
    else
      render :edit, status: :bad_request
      return
    end
  end

  def destroy
    passenger = Passenger.find_by(id: params[:id])
    if passenger.nil?
      return head :not_found 
    else
      passenger.destroy
      redirect_to passengers_path
    end
  end

  private

  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num)
  end
end
