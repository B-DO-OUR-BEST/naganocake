class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  
  validates :customer_id, presence: true
  validates :post_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :shipping_cost, presence: true
  validates :total_payment, presence: true
  validates :payment_method, presence: true
  validates :status, presence: true
  
  def normalize_post_code
      self.post_code = self.post_code.tr("０-９ａ-ｚＡ-Ｚ（）－−", "0-9a-zA-Z  ()-")
  end
end
