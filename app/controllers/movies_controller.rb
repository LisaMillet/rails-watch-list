class MoviesController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurand.find(params[:id])
  end

end
