class Recipe < ActiveRecord::Base
  belongs_to :chef
  validates :chef_id, presence: true
  validates :name, presence: true, length: {minimum:5, maximum:10}
  validates :summary, presence: true, length: {minimum:10, maximum:150}
  validates :description, presence: true, length: {minimum: 20, maximum: 200}
end