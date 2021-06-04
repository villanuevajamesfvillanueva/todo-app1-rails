class RemovingIntegerIdAndAddingUsernameColToUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :integer_id, :integer
    add_column :users, :username, :string
  end
end
