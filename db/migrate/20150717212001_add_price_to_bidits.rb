class AddPriceToBidits < ActiveRecord::Migration
  def change
    add_column :bidits, :price, :float
  end
end
