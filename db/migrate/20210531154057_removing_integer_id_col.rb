class RemovingIntegerIdCol < ActiveRecord::Migration[6.1]
  def change
    remove_column :tasks, :integer_id
    remove_column :categories, :integer_id
  end
end
