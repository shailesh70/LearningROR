class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.string :source
      t.string :destination
      t.string :stoppage_city
      t.string :date_of_journey
      t.string :time
      t.decimal :price
      t.integer :seats
      t.string :about_ride
      t.references :user_id

      t.timestamps
    end
    add_index :rides, :user_id_id
  end
end
