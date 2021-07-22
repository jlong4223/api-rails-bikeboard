class RemoveBioFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :bio, :website
  end
end
