class Histories < ActiveRecord::Migration[7.0]
  def change
    create_table :histories do |t|
      # 必要なカラムをここに追加します
      t.references :item, null: false
      t.references :user, null: false
    end
  end
end