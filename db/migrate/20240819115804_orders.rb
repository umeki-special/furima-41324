class Orders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :price  ,null: false
    end
  end
end
