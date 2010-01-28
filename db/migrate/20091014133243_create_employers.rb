class CreateEmployers < ActiveRecord::Migration
  def self.up
    create_table :employers, :force => true do |t|
      t.integer :user_id, :id_kraj
      t.decimal :lat, :precision => 15, :scale => 10
      t.decimal :lng, :precision => 15, :scale => 10
      t.string :name, :street1, :street2, :town, :zip_code, :email1, :email2, :www1, :www2, :phone1, :phone2, :fax1, :fax2, :ico, :dic
      t.string :kraj, :limit => 100
      t.string :kraj_kod, :limit => 10
      t.text :anotation
      t.timestamps
    end
    add_index :employers, [:user_id],   :name => 'employers_user_id_index'
    add_index :employers, [:id_kraj], :name => 'employers_id_kraj_index'
    add_index :employers, [:kraj_kod], :name => 'employers_kraj_kod_index'
  end

  def self.down
    drop_table :employers
  end
end