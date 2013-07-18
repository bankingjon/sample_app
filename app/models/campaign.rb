class Campaign < ActiveRecord::Base
  attr_accessible :drop_date, :name
  has_many :appeals, dependent: :destroy
  has_many :donations, through: :appeals

  validates :name, presence: true
  validates :drop_date, presence: true


end
