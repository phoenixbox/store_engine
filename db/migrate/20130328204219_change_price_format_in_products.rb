class ChangePriceFormatInProducts < ActiveRecord::Migration
  def up
    remove_column :products, :price
    add_column :products, :price, :integer
  end

  def down
    remove_column :products, :price
    add_column :products, :price, :string
  end
end
