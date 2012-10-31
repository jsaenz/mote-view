class CreatePorts < ActiveRecord::Migration
  def up
  	create_table :ports do |t|
  		t.integer :sensor_id
  		t.integer :mote_id
  		t.integer :transform_id

  		t.integer :portNumber
  	end
  end

  def down
  	drop_table :ports
  end
end
