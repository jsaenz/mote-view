class Sensor < ActiveRecord::Base
  attr_accessible :content, :description, :name

  has_many :ports
  has_many :motes, through: :ports 
end
