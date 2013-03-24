class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.references :category
      t.references :product

      t.timestamps
    end
    add_index :taggings, :category_id
    add_index :taggings, :product_id
  end
end
