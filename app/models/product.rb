class Product < ApplicationRecord
  belongs_to :user
  has_many :order_items

  validates :name, presence: true
  validates :category, presence: true
  validates :effect, presence: true
  validates :lifespan_days, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :side_effects, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :image, presence: true

end
