class Product < ApplicationRecord

  attachment :image

  has_many :purchase_products
  has_many :carts
  has_many :discs
  belongs_to :label
  belongs_to :genre
  belongs_to :artist

  accepts_nested_attributes_for :discs, allow_destroy: true

  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Product.where(['product_name LIKE ?', "%#{search}%"])
    else
      Product.all #全て表示。
    end
  end



end
