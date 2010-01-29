class CreateUserRounds < ActiveRecord::Migration
  def self.up
    create_table :user_rounds do |t|
      t.integer  :user_id
      t.integer  :round_id
      t.timestamps
    end
  end

  def self.down
    drop_table :user_rounds
  end
end
