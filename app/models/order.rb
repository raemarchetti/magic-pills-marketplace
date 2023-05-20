class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product


  # def sub_total
  #   sum = 0
  #   self.order_items.each do |order_item|
  #     sum+= order_item.total_price
  #   end
  #   return sum
  # end
end
