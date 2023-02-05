class CreateShopComments < ActiveRecord::Migration[6.1]
  def change
    create_table :shop_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :shop_id

      t.timestamps
    end
  end
end
