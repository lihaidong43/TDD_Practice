
class Contact < ActiveRecord::Base
  validates_presence_of :firstname,:lastname,:email
  validates_uniqueness_of :email
  attr_accessible :email, :firstname, :lastname

  has_many :phones

  def self.by_letter(letter)
    where('lastname like ?',"#{letter}%").order(:firstname)
  end

  def name
    [firstname,lastname].join(' ')
  end
end

