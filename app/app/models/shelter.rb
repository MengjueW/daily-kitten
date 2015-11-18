class Shelter < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #include Geocoder::Model::Mongoid
  #geocoded_by :zipcode
  #after_validation :geocode  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :cats, dependent: :destroy
end
