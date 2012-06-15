class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :rotten_tomatoes_id
      t.string :title
      t.integer :year
      t.integer :runtime
      t.string :thumbnail_url
      t.string :detailed_url
      t.integer :user_id

      t.timestamps
    end
  end
end
