class CreateSensors < ActiveRecord::Migration
  def change
    create_table :sensors do |t|
      t.string :name
      t.string :description
      t.text :content

      t.timestamps
    end
  end
end
