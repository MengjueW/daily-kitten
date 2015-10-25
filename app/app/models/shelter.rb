class Shelter < ActiveRecord::Base
    validates :title, presence: true
    validates :city, presence: true
    validates :url, presence: true, uniqueness: true
end
