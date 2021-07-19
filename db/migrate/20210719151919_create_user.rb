class CreateUser < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :role
      t.string :avatar_url
      t.string :bio
      t.string :website
      t.string :location
      t.timestamps
    end
  end
end
