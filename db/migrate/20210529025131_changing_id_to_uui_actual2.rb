class ChangingIdToUuiActual2 < ActiveRecord::Migration[6.1]
  def up
    add_column :categories, :uuid, :uuid, default: "gen_random_uuid()", null: false
    rename_column :categories, :id, :integer_id
    rename_column :categories, :uuid, :id
    execute "ALTER TABLE categories drop constraint categories_pkey;"
    execute "ALTER TABLE categories ADD PRIMARY KEY (id);"

    # Optionally you remove auto-incremented
    # default value for integer_id column
    execute "ALTER TABLE ONLY categories ALTER COLUMN integer_id DROP DEFAULT;"
    change_column_null :categories, :integer_id, true
    execute "DROP SEQUENCE IF EXISTS categories_id_seq"
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
