class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.string :name
      t.string :description
      t.string :end_on
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
