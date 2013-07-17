class CreateAppeals < ActiveRecord::Migration
  def change
    create_table :appeals do |t|
      t.integer :client_file_id
      t.float :ask1
      t.float :ask2
      t.float :ask3
      t.string :scanline
      t.string :tier
      t.string :tiercode
      t.string :mailcode
      t.string :mailtype

      t.timestamps
    end

    add_index :appeals, [:client_file_id, :scanline]
    add_index :appeals, :client_file_id
    add_index :appeals, :scanline
    add_index :appeals, :tier
    add_index :appeals, :tiercode
    add_index :appeals, :mailcode
    add_index :appeals, :mailtype
  end
end
