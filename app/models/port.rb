# A join table for motes, sensors, and transforms
# @author Tyler Hunt
class Port < ActiveRecord::Base

	#portNumber is meant to be a reference to a sensor port
	# on a physical mote
	attr_accessible :portNumber, :transforms, :mote, :sensor

	belongs_to :mote
	belongs_to :sensor
	has_many :transformPorts
	has_many :transforms, through: :transformPorts
	
end