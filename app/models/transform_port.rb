# Join model for ports and transforms
# a port may have any number of transforms
# @author Tyler Hunt
class TransformPort < ActiveRecord::Base
  attr_accessible :port_id, :transform_id

  belongs_to :port
  belongs_to :transform
end
