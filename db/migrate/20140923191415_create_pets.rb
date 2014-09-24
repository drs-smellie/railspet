class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :picture
      t.integer :max_weight
      t.integer :eat_score

      t.timestamps
    end
  end
end
