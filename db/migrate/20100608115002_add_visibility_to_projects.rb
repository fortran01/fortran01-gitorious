class AddVisibilityToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :visibility, :boolean, :default => 1
  end

  def self.down
    remove_column :projects, :visibility
  end
end
