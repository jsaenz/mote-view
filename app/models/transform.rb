class Transform < ActiveRecord::Base
  attr_accessible :content, :description, :name

  has_many :transform_ports
  has_many :ports, through: :transform_ports
end
