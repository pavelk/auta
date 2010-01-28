class CreateSchools < ActiveRecord::Migration
  def self.up
    create_table :schools, :force => true do |t|
      t.integer  :user_id
      t.decimal  :lat, :precision => 15, :scale => 10
      t.decimal  :lng, :precision => 15, :scale => 10
      t.string   :name, :street, :town, :zip_code, :email1, :email2, :www, :phone, :fax
      t.text     :anotation
      t.string   :okres_kod,  :limit => 10
      t.string   :okres,      :limit => 100
      t.string   :kraj_kod,   :limit => 10
      t.string   :kraj,       :limit => 100
      t.timestamps
    end
    add_index :schools, [:user_id],   :name => 'schools_user_id_index'
    add_index :schools, [:okres_kod], :name => 'schools_okres_kod_index'
    add_index :schools, [:kraj_kod], :name => 'sections_kraj_kod_index'
  end

  def self.down
    drop_table :schools
  end
end