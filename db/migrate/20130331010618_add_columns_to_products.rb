class AddColumnsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :long_title, :string
    add_column :products, :long_description, :text
    add_column :products, :bullet1, :string
    add_column :products, :bullet2, :string
    add_column :products, :bullet3, :string
    add_column :products, :bullet4, :string
    add_column :products, :bullet5, :string
    add_column :products, :color, :string
    add_column :products, :asin, :string
    add_column :products, :model_number, :string
    add_column :products, :photo_url, :string
    add_column :products, :units, :string
    add_column :products, :cost_cents, :integer
    add_column :products, :length, :string
    add_column :products, :width, :string
    add_column :products, :height, :string
    add_column :products, :weight, :string
    add_column :products, :upc, :string
  end
end
