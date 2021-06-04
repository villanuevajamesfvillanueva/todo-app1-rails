class ChangingDatatypeOfUserIdInCategoriesTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :categories, :user_id, :integer
    add_column :categories, :user_id, :uuid
  end
end
