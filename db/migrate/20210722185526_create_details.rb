class CreateDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :details do |t|
      t.string :address
      t.string :bio
      t.string :zip_code
      t.string :biker_type
      t.string :current_bike
      t.integer :phone
      t.integer :bike_count
      t.string :fav_trail
      t.integer :user_id

      t.timestamps
    end
  end
end
