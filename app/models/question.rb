class Question < ActiveRecord::Base
  validates :title, :presence => true
  validates :query, :presence => true
  belongs_to :user
end
