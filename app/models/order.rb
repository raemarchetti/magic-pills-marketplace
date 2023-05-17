class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :order_items, dependent: :destroy
end
