class CreateShippingDestinations < ActiveRecord::Migration[7.1]
  def change
    create_table :shipping_destinations do |t|
      t.string :postnumber, null: false
      t.integer :prefecture_id, null: false
      t.string :municipality, null: false
      t.string :street_address, null: false
      t.string :building
      t.string :tel, null: false
      t.references :buy, null: false, foreign_key: true
      t.timestamps
    end
  end
end
