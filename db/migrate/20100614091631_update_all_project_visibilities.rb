class UpdateAllProjectVisibilities < ActiveRecord::Migration
  def self.up
    Project.update_all("visibility = 1")
  end

  def self.down
  end
end
