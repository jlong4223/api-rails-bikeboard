class RemoveColumnFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :website, :location
  end
end
