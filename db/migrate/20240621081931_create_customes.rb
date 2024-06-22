class CreateCustomes < ActiveRecord::Migration[6.1]
  def change
    create_table :customes do |t|
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      
      t.string :last_name ,null: false #名前(姓)
      t.string :first_name ,null: false #名前(名)
      t.string :last_name_kana ,null: false #カナ(姓)
      t.string :first_name_kana ,null: false #カナ(名)
      t.string :post_code ,null: false #郵便番号
      t.string :address ,null: false #住所
      t.string :telephone_number ,null: false #電話番号
      t.boolean :is_active ,null: false, default: true
      
      
      t.timestamps
    end
  end
end
