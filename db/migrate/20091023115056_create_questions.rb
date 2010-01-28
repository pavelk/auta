class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.integer :round_id
      t.string :question
    end
    add_index :questions, [:round_id]
  end

  def self.down
    drop_table :questions
  end
end
