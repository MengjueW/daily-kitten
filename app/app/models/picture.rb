class Picture < ActiveRecord::Base
  belongs_to :cat
  has_attached_file :image, styles: { origin: "300x300>", medium: "400x300#", thumb: "100x75#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end