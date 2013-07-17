class Campaign < ActiveRecord::Base
  attr_accessible :drop_date, :name

  validates :name, presence: true
  validates :drop_date, presence: true


end