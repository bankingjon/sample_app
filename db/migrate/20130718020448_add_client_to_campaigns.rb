class AddClientToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :client_id, :integer
    add_column :campaigns, :mp_managed, :boolean
  end
end
