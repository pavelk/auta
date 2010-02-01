class AddAnswerToUserRounds < ActiveRecord::Migration
  def self.up
    add_column :user_rounds, :answer_ok, :boolean
    add_index :user_rounds, [:user_id],   :name => 'user_rounds_user_id_index'
    add_index :user_rounds, [:round_id],   :name => 'user_rounds_round_id_index'
  end

  def self.down
    remove_column :user_rounds, :answer_ok
  end
end
