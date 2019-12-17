class Comment < ApplicationRecord
  belongs_to :station
  belongs_to :category
  belongs_to :user

  validates :rate, presence: true
  validates :content, presence: true


end
