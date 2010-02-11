class ChangeUroleType < ActiveRecord::Migration
  def self.up
    change_column :users, :urole, :integer, :null => false, :default => 0
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
