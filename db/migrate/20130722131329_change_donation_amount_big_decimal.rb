class ChangeDonationAmountBigDecimal < ActiveRecord::Migration
  def up
  	change_column :donations :amount bigdecimal
  end

  def down
  end
end
