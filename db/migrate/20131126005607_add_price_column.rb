class AddPriceColumn < ActiveRecord::Migration
  def change
    add_column :menu_items, :price, :string
  end
end
