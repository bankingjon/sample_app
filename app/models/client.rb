class Client < ActiveRecord::Base
  attr_accessible :name

  has_many :campaigns
  has_many :donations

  validates :name, presence: true
end
