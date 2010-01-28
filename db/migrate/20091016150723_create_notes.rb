class CreateNotes < ActiveRecord::Migration
  def self.up
    create_table :notes, :force => true do |t|
      t.string :name
      t.text :perex, :content
      t.boolean :visible, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :notes
  end
end

