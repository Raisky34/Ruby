class IndexController < ApplicationController
  def index
    @results = []
    if params[:commit]
      @results = Trip.where('airport_from_id = :from and airport_to_id = :to', from: params[:airport_from], to: params[:airport_to]).order(time_out: :asc)
    end
  end

  private

  def search_params
    params[:trip].permit(:airport_from_id, :airport_to_id)
  end
end
