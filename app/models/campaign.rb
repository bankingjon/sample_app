class Campaign < ActiveRecord::Base
  attr_accessible :drop_date, :name
  has_many :appeals, dependent: :destroy

  validates :name, presence: true
  validates :drop_date, presence: true


end
