class AirportsController < ApplicationController

  before_action :find_airport, only: %i[edit update show destroy]

  def index
    @airports = Airport.all
  end

  def new
    @airport = Airport.new
  end

  def create
    @airport = Airport.new(airport_params)

    if @airport.save
      redirect_to airports_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @airport.update(airport_params)
      flash.now[:error] = 'test'
      redirect_to airports_path
    else
      render :edit
    end
  end

  def show; end

  def destroy
    if @airport.destroy
      redirect_to airports_path
    else
      redirect_to airports_path, error: 'An error occured on Airport deleting'
    end
  end

  private

  def airport_params
    params[:airport].permit(:name, :city, :country_id)
  end

  def find_airport
    @airport = Airport.find(params[:id])
  end

end
