class CreateSections < ActiveRecord::Migration
  def self.up
    create_table :sections, :force => true do |t|
      t.string :name, :course
      t.integer :visits
      t.text :exercise
      t.boolean :graduation, :default => false
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :sections
  end
end