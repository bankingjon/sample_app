class AddCampaignIdToAppeals < ActiveRecord::Migration
  def change
    add_column :appeals, :campaign_id, :integer
  end
end
