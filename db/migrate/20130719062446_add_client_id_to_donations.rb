class AddClientIdToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :client_id, :integer
  end
end
