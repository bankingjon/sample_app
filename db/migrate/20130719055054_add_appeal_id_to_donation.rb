class AddAppealIdToDonation < ActiveRecord::Migration
  def change
    add_column :donations, :appeal_id, :integer
  end
end
