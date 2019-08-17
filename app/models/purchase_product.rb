class PurchaseProduct < ApplicationRecord
	belongs_to :product
	belongs_to :purchase
end
