class CountriesController < ApplicationController

  before_action :find_country, only: %i[edit update show destroy]

  def index
    @countries = Country.all
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)

    if @country.save
      redirect_to countries_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @country.update(country_params)
      flash.now[:error] = 'test'
      redirect_to countries_path
    else
      render :edit
    end
  end

  def show; end

  def destroy
    if @country.destroy
      redirect_to countries_path
    else
      redirect_to countries_path, error: 'An error occured on Country deleting'
    end
  end

  private

  def country_params
    params[:country].permit(:name)
  end

  def find_country
    @country = Country.find(params[:id])
  end

end
