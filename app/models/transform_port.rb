class TransformPort < ActiveRecord::Base
  attr_accessible :port_id, :transform_id

  belongs_to :port
  belongs_to :transform
end
