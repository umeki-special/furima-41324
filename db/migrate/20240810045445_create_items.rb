class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :price, null: false
      t.string :name, null: false
      t.text :description_of_item, null: false
      t.integer :category_id, null: false
      t.integer :status_id, null: false
      t.integer :shipping_method_id, null: false
      t.integer :region_of_origin_id, null: false
      t.integer :estimated_shipping_date_id, null: false
      t.boolean :sold, default: false, null: false  # ここでsoldカラムを追加
      t.timestamps
    end
  end
end
