
class Phone < ActiveRecord::Base
  attr_accessible :type,:number
  validates_uniqueness_of :number,:scope => :contact_id
  belongs_to :contact

end

