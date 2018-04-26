class PlanesController < ApplicationController
  before_action :find_plane, only: %i[edit update show destroy]

  def index
    @planes = Plane.all
  end

  def new
    @plane = Plane.new
  end

  def create
    @plane = Plane.new(plane_params)

    if @plane.save
      redirect_to planes_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @plane.update(plane_params)
      flash.now[:error] = 'test'
      redirect_to planes_path
    else
      render :edit
    end
  end

  def show; end

  def destroy
    if @plane.destroy
      redirect_to planes_path
    else
      redirect_to planes_path, error: 'An error occured on Plane deleting'
    end
  end

  private

  def plane_params
    params[:plane].permit(:name)
  end

  def find_plane
    @plane = Plane.find(params[:id])
  end
end
