class MoviesController < ApplicationController
  before_filter :authenticate_user!

  respond_to :json
  respond_to :html, only: [:new, :show, :index]

  def create
    respond_with(current_user.movies.create(params[:movie]).tap do |m|
      current_user.vote_for(m)
    end)
  end

  def show
    respond_with @movie = Movie.find(params[:id])
  end

  def index
    respond_with @movies = Movie.plusminus_tally.order('plusminus_tally DESC')
  end

  def vote
    movie = Movie.find(params[:id])
    current_user.vote(movie, direction: params[:vote] == 'true' ? :up : :down, exclusive: true)

    render json: {score: movie.plusminus}
  end
end
