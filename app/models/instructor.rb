class Instructor < ActiveRecord::Base
  geocoded_by :postal_code
  after_validation :geocode

end
