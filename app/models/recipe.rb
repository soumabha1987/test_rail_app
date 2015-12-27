class Recipe < ActiveRecord::Base
  belongs_to :chef
  has_many :likes
  validates :name, presence: true, length: {minimum:1, maximum:10}
  validates :summary, presence: true, length: {minimum:1, maximum:150}
  validates :description, presence: true, length: {minimum: 10, maximum: 200}
  mount_uploader :picture, PictureUploader
  default_scope -> { order(updated_at: :desc) }
  
  def total_thumbs_up
    self.likes.where(likes: true).size
  end
  
  def total_thumbs_down
    self.likes.where(likes: false).size
  end
end