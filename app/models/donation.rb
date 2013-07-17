class Donation < ActiveRecord::Base
  attr_accessible :amount, :campaign, :channel, :client_file_id, :gift_date, :gift_id, :scanline

  validates :amount, presence: true
  validates :client_file_id, presence: true
  validates :gift_date, presence: true
  validates :gift_id, presence:true
  

end
