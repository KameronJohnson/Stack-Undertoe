class Question < ActiveRecord::Base
  validates :title, :presence => true
  validates :query, :presence => true
end
