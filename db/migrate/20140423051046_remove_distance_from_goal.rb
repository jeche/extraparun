class RemoveDistanceFromGoal < ActiveRecord::Migration
  def change
    remove_column :goals, :distance, :float
  end
end
