class Donation < ActiveRecord::Base
  attr_accessible :amount, :campaign, :channel, :client_file_id, :gift_date, :gift_id, :scanline, :client_id, :appeal_id

  validates :amount, presence: true
  validates :client_file_id, presence: true
  validates :gift_date, presence: true
  validates :gift_id, presence: true
  # validates :client_id, presence: true

def self.to_csv(owner)
    @donations = owner.donations
    CSV.generate do |csv|
      csv << column_names
      @donations.each do |donation|
        csv << donation.attributes.values
      end
    end
  end

end
