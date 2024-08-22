class Destinations < ActiveRecord::Migration[7.0]
  def change
    create_table :destinations do |t|
      t.string :post_code, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :address2
      t.string :phone_number, null: false
      t.references :history, null: false, foreign_key: true
      t.timestamps
    end
  end
end
