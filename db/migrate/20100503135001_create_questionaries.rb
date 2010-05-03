class CreateQuestionaries < ActiveRecord::Migration
  def self.up
    create_table :questionaries do |t|
      t.string   :answers
      t.timestamps
    end
  end

  def self.down
    drop_table :questionaries
  end
end
