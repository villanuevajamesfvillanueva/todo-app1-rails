class AddingCategoryId < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :category_id, :uuid
    add_index :tasks, :category_id
  end
end
