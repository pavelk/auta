class CreateRounds < ActiveRecord::Migration
  def self.up
    create_table :rounds do |t|
      t.date :date_from, :date_till
    end
  end

  def self.down
    drop_table :rounds
  end
end
