class Campaign < ActiveRecord::Base
  attr_accessible :drop_date, :name, :mp_managed, :client_id
  
  belongs_to :client

  has_many :appeals, dependent: :destroy
  has_many :donations, through: :appeals

  validates :name, presence: true
  validates :client_id, presence: true
  # validates :mp_managed, presence: true	


end
