class CreateOpenDoors < ActiveRecord::Migration
  def self.up
    create_table :open_doors, :force => true do |t|
      t.integer :school_id
      t.string :description
      t.date :date_from
      t.date :date_till
    end
    add_index :open_doors, [:school_id],   :name => 'open_doors_school_id_index'
    add_index :open_doors, [:date_from], :name => 'open_doors_date_from_index'
    add_index :open_doors, [:date_till], :name => 'open_doors_date_till_index'
  end

  def self.down
    drop_table :open_doors
  end
end