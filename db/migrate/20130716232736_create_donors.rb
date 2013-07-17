class CreateDonors < ActiveRecord::Migration
  def change
    create_table :donors do |t|
      t.integer :client_file_id
      t.string :name
      t.string :address

      t.timestamps
    end

    add_index :donors, :client_file_id
    add_index :donors, :name
  end
end
