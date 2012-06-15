class MoviesController < ApplicationController
  respond_to :json
  respond_to :html, only: [:new, :show, :index]

  def create
    respond_with Movie.create(params[:movie])
  end

  def show
    respond_with @movie = Movie.find(params[:id])
  end

  def index
    respond_with @movies = Movie.all
  end
end
