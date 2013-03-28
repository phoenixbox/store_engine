class FixLineItemsColumnName < ActiveRecord::Migration
  def change
    rename_column :line_items, :product_id_id, :product_id
  end

end
