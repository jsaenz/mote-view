class CreateMotes < ActiveRecord::Migration
  def change
    create_table :motes do |t|
      t.string :name
      t.string :radio

      t.timestamps
    end
  end
end
