class CreateUserAnswers < ActiveRecord::Migration
  def self.up
    create_table :user_answers do |t|
      t.integer  :user_id
      t.integer  :answer_id
      t.timestamps
    end
    add_index :user_answers, [:user_id],   :name => 'user_answers_user_id_index'
    add_index :user_answers, [:answer_id],   :name => 'user_answers_answer_id_index'
  end

  def self.down
    drop_table :user_answers
  end
end
