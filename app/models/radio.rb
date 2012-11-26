class Radio < ActiveRecord::Base
  attr_accessible :content, :description, :name, :motes

  has_many :motes
end
