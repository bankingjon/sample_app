class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.integer :gift_id
      t.integer :client_file_id
      t.date :gift_date
      t.string :channel
      t.string :campaign
      t.string :scanline
      t.float :amount

      t.timestamps
    end

    add_index :donations, [:client_file_id, :gift_date]
    add_index :donations, [:client_file_id, :scanline]
    add_index :donations, :client_file_id
    add_index :donations, :gift_date
    add_index :donations, :scanline
    add_index :donations, :campaign
    add_index :donations, :amount
    add_index :donations, :channel
  end
end
