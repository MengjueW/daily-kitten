class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :link
  belongs_to :cat
end
