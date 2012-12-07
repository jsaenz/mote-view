# One mote can have one radio and any number of transforms and sensors
# @author Tyler Hunt
# @note transforms are a nested association and as such must be added via a port objects
class Mote < ActiveRecord::Base

  attr_accessible :name, :radio, :sensors, :transforms
  
  validates :name,  presence: true, length: { maximum: 50 }, uniqueness: true

  belongs_to :radio
  has_many :ports
  has_many :sensors, through: :ports
  has_many :transforms, through: :ports

  # Override json definition for objects of this type
  #   includes information about radio sensors and transforms
  # @author Tyler Hunt
  # @param [hash] options - we don't care it is thrown away
  # @return [hash] representation of this in JSON
  def as_json(options = {})
  	ports = self.ports
  	sensors = {}
  	transforms = {}
  	if self.radio.nil?
  	 rado = ""
  	else
  	 rado = self.radio.name
    end
  	ports.each do |port|
  		if port.portNumber < 10
  			prefix = 'A0'
  		else
  			prefix = 'A'
  		end
  		name = prefix + port.portNumber.to_s
  		sensors[name] = port.sensor.name
  		i = 0
  		port.transforms.each do |transform|
  			tranName = name + '_' + i.to_s
  			i = i + 1
  			transforms[tranName] = transform.name
  		end
    end

  	{ mote: {name: self.name, radio: rado, sensors: sensors, transforms: transforms}}
  end
end
