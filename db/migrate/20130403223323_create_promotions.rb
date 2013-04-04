class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.references :product
      t.string :title
      t.integer :percent
      t.date :start
      t.date :end

      t.timestamps
    end
    add_index :promotions, :product_id
  end
end
