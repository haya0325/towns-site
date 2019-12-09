class Comment < ApplicationRecord
  belongs_to :stations
  belongs_to :categories
  belongs_to :users
end
