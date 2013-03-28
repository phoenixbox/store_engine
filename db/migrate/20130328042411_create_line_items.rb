class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :order
      t.references :product_id
      t.integer :quantity
      t.integer :unit_price_cents

      t.timestamps
    end
    add_index :line_items, :order_id
    add_index :line_items, :product_id_id
  end
end
