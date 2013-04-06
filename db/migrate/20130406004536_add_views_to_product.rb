class AddViewsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :page_views, :integer, :default => 0
  end
end
