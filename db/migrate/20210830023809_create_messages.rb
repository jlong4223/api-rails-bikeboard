class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :user_id
      t.integer :zip
      t.string :content
      t.integer :likes
      t.integer :dislikes
      t.string :comments

      t.timestamps
    end
  end
end
