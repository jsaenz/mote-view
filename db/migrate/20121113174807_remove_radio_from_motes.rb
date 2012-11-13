class RemoveRadioFromMotes < ActiveRecord::Migration
  def up
    remove_column :motes, :radio
  end

  def down
    add_column :motes, :radio, :string
  end
end
