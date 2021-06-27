class Product < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :carts, through: :cart_items 
  has_many :orders, through: :order_items

  belongs_to :category
end
