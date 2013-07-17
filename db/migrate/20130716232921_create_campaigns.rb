class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name
      t.date :drop_date

      t.timestamps
    end

    add_index :campaigns, :name
    add_index :campaigns, :drop_date
    
  end
end
