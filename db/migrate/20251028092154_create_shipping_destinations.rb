class CreateShippingDestinations < ActiveRecord::Migration[7.1]
  def change
    create_table :shipping_destinations do |t|

      t.timestamps
    end
  end
end
