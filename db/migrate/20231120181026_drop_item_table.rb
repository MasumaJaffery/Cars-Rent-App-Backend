class DropItemTable < ActiveRecord::Migration[7.1]
  def up
    drop_table :items
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
