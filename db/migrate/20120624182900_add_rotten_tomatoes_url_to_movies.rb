class AddRottenTomatoesUrlToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :rotten_tomatoes_url, :string
  end
end
