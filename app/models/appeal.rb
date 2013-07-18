class Appeal < ActiveRecord::Base
  attr_accessible :ask1, :ask2, :ask3, :client_file_id, :mailcode, :mailtype, :scanline, :tier, :tiercode

  belongs_to :campaign

  has_many :donations, foreign_key: "scanline"

  validates :campaign_id, presence: true
  validates :client_file_id, presence: true
  validates :scanline, presence: true
  

  def self.import(file, campaign)
  	CSV.foreach(file.path, headers: true) do |row|
  		campaign.appeals.create! row.to_hash
  	end
  end

  def self.to_csv(campaign)
    @appeals = campaign.appeals
    CSV.generate do |csv|
      csv << column_names
      @appeals.each do |appeal|
        csv << appeal.attributes.values
      end
    end
  end

end
