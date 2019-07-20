class Product < ApplicationRecord

  attachment :image

  has_many :purchase_products
  has_many :carts
  has_many :discs
  belongs_to :label
  belongs_to :genre
  belongs_to :artist

  accepts_nested_attributes_for :
end
