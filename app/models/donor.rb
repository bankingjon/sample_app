class Donor < ActiveRecord::Base
  attr_accessible :address, :client_file_id, :name

  validates :client_file_id, presence: true
end
