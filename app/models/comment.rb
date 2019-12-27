class Comment < ApplicationRecord
  belongs_to :station
  belongs_to :category
  belongs_to :user

  validates :rate, presence: true
  validates :content, presence: true

  def self.get_station_ids(category_id)
    Comment.where(category_id: category_id).group(:station_id).order('rate DESC').limit(5).count(:station_id).keys
  end
end
