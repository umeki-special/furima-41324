class AddDetailsToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :postal_code, :string
    add_column :orders, :prefecture, :string
    add_column :orders, :city, :string
    add_column :orders, :address, :string
    add_column :orders, :building, :string
    add_column :orders, :phone_number, :string
  end
end
