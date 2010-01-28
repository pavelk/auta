class SchoolsSections < ActiveRecord::Migration
  def self.up
    create_table :schools_sections, :id => false do |t|
      t.integer :school_id, :section_id
    end
    add_index :schools_sections, :school_id
    add_index :schools_sections, :section_id
  end

  def self.down
    drop_table :schools_sections
  end
end
