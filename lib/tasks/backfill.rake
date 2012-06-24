require 'open-uri'

namespace :backfill do
  desc 'Backfill rottentomatoes urls'
  task rotten_tomatoes_url: :environment do
    Movie.where(rotten_tomatoes_url: nil).each do |m|
      open("http://api.rottentomatoes.com/api/public/v1.0/movies/#{m.rotten_tomatoes_id}.json?apikey=q7z8hbstffshryw5y792skpt") do |f|
        m.update_attributes(rotten_tomatoes_url: JSON::parse(f.read)['links']['alternate'])
      end
    end
  end
end
