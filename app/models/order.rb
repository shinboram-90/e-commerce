class Order < ApplicationRecord
  has_many :order_items
  belongs_to :user

  enum status: { pending: 0, confirmed: 1, shipped: 2, cancelled: 3, refunded: 4  }
end
