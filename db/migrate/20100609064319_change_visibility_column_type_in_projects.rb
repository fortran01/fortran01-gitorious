class ChangeVisibilityColumnTypeInProjects < ActiveRecord::Migration
  def self.up
    change_column :projects, :visibility, :integer, :default => 1
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
