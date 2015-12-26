class Recipe < ActiveRecord::Base
  belongs_to :chef
  validates :name, presence: true, length: {minimum:1, maximum:10}
  validates :summary, presence: true, length: {minimum:1, maximum:150}
  validates :description, presence: true, length: {minimum: 10, maximum: 200}
  mount_uploader :picture, PictureUploader
  
end