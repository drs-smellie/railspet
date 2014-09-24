class RemoveEatScoreFromPets < ActiveRecord::Migration
  def change
    remove_column :pets, :eat_score, :integer
  end
end
