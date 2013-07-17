class Appeal < ActiveRecord::Base
  attr_accessible :ask1, :ask2, :ask3, :client_file_id, :mailcode, :mailtype, :scanline, :tier, :tiercode

  validates :client_file_id, presence: true
  validates :scanline, presence: true
  

end
