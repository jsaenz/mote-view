class CreateTransformPorts < ActiveRecord::Migration
  def change
    create_table :transform_ports do |t|
      t.integer :transform_id
      t.integer :port_id

      t.timestamps
    end
  end
end
