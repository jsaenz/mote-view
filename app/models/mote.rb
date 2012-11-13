class Mote < ActiveRecord::Base
  attr_accessible :name, :radio, :sensors, :ports, :transforms
  
  validates :name,  presence: true, length: { maximum: 50 }, uniqueness: true

  belongs_to :radio
  has_many :ports
  has_many :sensors, through: :ports
  has_many :transforms, through: :ports
end
