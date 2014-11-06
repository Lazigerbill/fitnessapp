class Instructor < ActiveRecord::Base
  geocoded_by :postal_code
  after_validation :geocode

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_many :appointments
  has_many :users, through: :appointments
end
