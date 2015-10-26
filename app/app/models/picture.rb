class Picture < ActiveRecord::Base
  belongs_to :cat
  has_attached_file :image, styles: { medium: "400x300#", thumb: "200x150#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end