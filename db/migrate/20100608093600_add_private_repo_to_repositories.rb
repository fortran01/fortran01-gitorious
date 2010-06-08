class AddPrivateRepoToRepositories < ActiveRecord::Migration
  def self.up
    add_column :repositories, :private_repo, :boolean, :default => 0
  end

  def self.down
    remove_column :repositories, :private_repo
  end
end
