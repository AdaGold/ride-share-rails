class DriversController < ApplicationController

  def index
    @drivers = Driver.all
  end

  def show
    @driver = Driver.find_by(id: params[:id])
    if @driver.nil?
      head :not_found
      return
    end
  end

  def new
    @driver = Driver.new
  end

  # this method makes the driver default to available (true)
  def driver_created
    new_driver = driver_params
    if new_driver[:available].nil?
      new_driver[:available] = true
    end

    return new_driver
  end

  def create
    @driver = Driver.new(driver_created) 
    if @driver.save 
      flash[:success] = "#{@driver.name.capitalize} was successfully added!"
      redirect_to driver_path(@driver.id) 
      return
    else
      flash.now[:error] = "#{@driver && @driver.name ? @driver.name.capitalize : ""} was NOT successfully added!"
      render :new, status: :bad_request
      return
    end
  end

  def edit
    @driver = Driver.find_by(id: params[:id])

    if @driver.nil?
      head :not_found
    end
  end

  def update
    @driver = Driver.find_by(id: params[:id])
    if @driver.nil?
      head :not_found
      return
    elsif @driver.update(driver_params)
      redirect_to driver_path(@driver.id)
      return
    else
      render :edit, status: :bad_request
      return
    end
  end

  def destroy
    @driver = Driver.find_by(id: params[:id])
    if @driver.nil?
      head :not_found
      return 
    else
      @driver.destroy
      redirect_to drivers_path
      return
    end
  end


  def make_available
    @driver = Driver.find_by(id: params[:id])
    if @driver[:available]
      @driver.update(available: false)
    else
      @driver.update(available: true)
    end

    redirect_to driver_path(@driver.id)
    return
  end

  private

  def driver_params
    return params.require(:driver).permit(:name, :vin, :available)
  end
  
end
