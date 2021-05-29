class ChangingIdToUuiActual < ActiveRecord::Migration[6.1]
  def up
    add_column :tasks, :uuid, :uuid, default: "gen_random_uuid()", null: false
    rename_column :tasks, :id, :integer_id
    rename_column :tasks, :uuid, :id
    execute "ALTER TABLE tasks drop constraint tasks_pkey;"
    execute "ALTER TABLE tasks ADD PRIMARY KEY (id);"

    # Optionally you remove auto-incremented
    # default value for integer_id column
    execute "ALTER TABLE ONLY tasks ALTER COLUMN integer_id DROP DEFAULT;"
    change_column_null :tasks, :integer_id, true
    execute "DROP SEQUENCE IF EXISTS tasks_id_seq"
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
