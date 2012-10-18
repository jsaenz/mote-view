class CreateRadios < ActiveRecord::Migration
  def change
    create_table :radios do |t|
      t.string :name
      t.string :description
      t.text :content

      t.timestamps
    end
  end
end
