class CreateBads < ActiveRecord::Migration[6.1]
  def change
    create_table :bads do |t|
      t.integer :user_id
      t.integer :shop_id

      t.timestamps
    end
  end
end
