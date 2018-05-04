class TripsController < ApplicationController
  before_action :find_trip, only: %i[edit update show destroy]

  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.users = [User.find(params[:user_id])]

    if @trip.save
      redirect_to trips_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @trip.update(trip_params)
      @trip.users = [User.find(params[:user_id])]
      flash.now[:error] = 'test'
      redirect_to trips_path
    else
      render :edit
    end
  end

  def show; end

  def destroy
    if @trip.destroy
      redirect_to trips_path
    else
      redirect_to trips_path, error: 'An error occured on Trip deleting'
    end
  end

  private

  def trip_params
    params[:trip].permit(:name, :time_in, :time_out, :plane_id, :airport_from_id, :airport_to_id, :cost)
  end

  def find_trip
    @trip = Trip.find(params[:id])
  end
end
