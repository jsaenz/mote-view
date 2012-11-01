class Port < ActiveRecord::Base
	belongs_to :mote
	belongs_to :sensor
	belongs_to :transform
end