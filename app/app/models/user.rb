class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #geocoded_by :zipcode
  #after_validation :geocode  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

