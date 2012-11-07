class Port < ActiveRecord::Base
	attr_accessible :portNumber, :transforms

	belongs_to :mote
	belongs_to :sensor
	has_many :transformPorts
	has_many :transforms, through: :transformPorts
	
end