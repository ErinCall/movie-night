class Movie < ActiveRecord::Base
  attr_accessible :rotten_tomatoes_id, :title, :year, :runtime, :thumbnail_url, :detailed_url

  validates_uniqueness_of :rotten_tomatoes_id, message: 'Movie has already been nominated'
  validates_numericality_of :runtime, less_than_or_equal_to: 125, message: 'Movie is over the 125 minute limit'

  belongs_to :user

  acts_as_voteable
end
