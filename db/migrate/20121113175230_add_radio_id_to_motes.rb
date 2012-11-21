class AddRadioIdToMotes < ActiveRecord::Migration
  def change
    add_column :motes, :radio_id, :integer
  end
end
