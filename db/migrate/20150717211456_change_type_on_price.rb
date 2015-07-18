class ChangeTypeOnPrice < ActiveRecord::Migration
  def change
    remove_column :bidits, :price
  end
end
