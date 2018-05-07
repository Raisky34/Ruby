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
    if params[:user_ids].length == 1
      @trip.users = [User.find(*params[:user_ids])]
    else
      @trip.users = User.find(*params[:user_ids])
    end

    if @trip.save
      redirect_to trips_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @trip.update(trip_params)
      if params[:user_ids].length == 1
        @trip.users = [User.find(*params[:user_ids])]
      else
        @trip.users = User.find(*params[:user_ids])
      end
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
    params[:trip].permit(:name, :time_in, :time_out, :plane_id, :airport_from_id, :airport_to_id, :cost, :user_id)
  end

  def find_trip
    @trip = Trip.find(params[:id])
  end
end
