class CreateAnimalBehaviors < ActiveRecord::Migration
  def change
    create_table :animal_behaviors do |t|
      t.string :code
      t.string :behavior

      t.timestamps
    end
  end
end
