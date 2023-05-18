class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :order, dependent: :destroy
  after_commit :create_order, on: :create

  has_many :orders

  def create_order
   Order.create(status: "open", user: self)
  end
end
