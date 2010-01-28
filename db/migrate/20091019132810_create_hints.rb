class CreateHints < ActiveRecord::Migration
  def self.up
    create_table :hints, :force => true do |t|
      t.string :name
      t.text :perex, :content
      t.boolean :visible, :default => false
      t.boolean :hint_type
      t.timestamps
    end
  end

  def self.down
    drop_table :hints
  end
end