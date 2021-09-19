class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :currency, null: false
      t.decimal :gross_amount, precision: 10, scale: 2, null: false
      t.decimal :discount_amount, precision: 10, scale: 2, null: false, default: 0
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
    add_index :orders, :currency
  end
end
