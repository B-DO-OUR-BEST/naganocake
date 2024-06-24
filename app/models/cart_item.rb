class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item


  def subtotal
    (cart_item.item.price).floor * amount
  end

  def taxtotal
    (item.price*1.1).floor
  end

  def update_amount(new_amount)
    update(amount: new_amount)
  end

end
