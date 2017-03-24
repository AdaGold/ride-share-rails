class DriversController < ApplicationController

  before_action :find_driver, only: [:show, :edit, :delete, :update]

  def index
    @drivers = Driver.order(:name).page params[:page]
  end

  def show
  end

  def new
    @driver = Driver.new
  end

  def create
  end

  def edit
  end

  def update

  end

  def delete

    @driver.destroy
    redirect_to drivers_path
  end

  private
    def find_driver
      @driver = Driver.find(params[:id])
    end

end
