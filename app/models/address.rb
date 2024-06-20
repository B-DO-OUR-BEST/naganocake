class Address < ApplicationRecord
  before_save :normalize_post_code
　def normalize_post_code
    self.post_code = self.post_code.tr("０-９ａ-ｚＡ-Ｚ（）－−", "0-9a-zA-Z  ()-")
  end

  belongs_to :customer
  
  validates :customer_id, presence: true
  validates :name, presence: true
  validates :address, presence: true
  validates :post_code, presence: true
end
