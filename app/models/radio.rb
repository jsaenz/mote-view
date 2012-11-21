class Radio < ActiveRecord::Base
  attr_accessible :content, :description, :name

  has_many :motes
end
