class CreateBidits < ActiveRecord::Migration
  def change
    create_table :bidits do |t|
      t.string :price
      t.references :user, index: true, foreign_key: true
      t.references :auction, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
