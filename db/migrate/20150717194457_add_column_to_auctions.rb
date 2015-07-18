class AddColumnToAuctions < ActiveRecord::Migration
  def change
    add_column :auctions, :reserved_price, :float
    add_column :auctions, :aasm_state, :string
  end
end
