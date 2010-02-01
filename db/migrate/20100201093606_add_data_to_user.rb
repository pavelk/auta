class AddDataToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :street, :string
    add_column :users, :city, :string
    add_column :users, :psc, :string
    add_column :users, :birth, :string
  end

  def self.down
    remove_column :users, :answer_ok
    remove_column :users, :city, :string
    remove_column :users, :psc, :string
    remove_column :users, :birth, :string
  end
end
