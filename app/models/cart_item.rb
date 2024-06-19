class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  def subtotal
    (cart_item.item.price).floor * amount
  end

end
