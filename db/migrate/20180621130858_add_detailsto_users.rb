class AddDetailstoUsers < ActiveRecord::Migration
  def up
  end

  def down
  end
  def change
  	add_column :users, :phone_number, :string
  	add_column :users, :year_of_birth, :decimal
  	add_column :users, :gender, :string
  	add_column :users, :bio, :string
  end
end
