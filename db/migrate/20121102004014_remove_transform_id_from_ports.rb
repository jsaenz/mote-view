class RemoveTransformIdFromPorts < ActiveRecord::Migration
  def up
    remove_column :ports, :transform_id
  end

  def down
    add_column :ports, :transform_id, :integer
  end
end
