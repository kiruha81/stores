class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.string :title
      t.text :body
      t.string :shop_name
      t.integer :user_id
      t.timestamps
    end
  end
end
