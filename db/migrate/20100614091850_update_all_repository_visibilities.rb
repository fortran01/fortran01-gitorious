class UpdateAllRepositoryVisibilities < ActiveRecord::Migration
  def self.up
    Repository.update_all("private_repo = 0")
  end

  def self.down
  end
end
