class Movie < ActiveRecord::Base
  attr_accessible :rotten_tomatoes_id, :title, :year, :runtime, :thumbnail_url, :detailed_url

  validates_uniqueness_of :rotten_tomatoes_id, :message => 'Movie has already been nominated'

  belongs_to :user
end
