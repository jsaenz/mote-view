class Mote < ActiveRecord::Base
  attr_accessible :name, :radio
  
  validates :name,  presence: true, length: { maximum: 50 }, uniqueness: true

  has_many :ports
  has_many :sensors, through: :ports
  has_many :transforms, through: :ports
end
