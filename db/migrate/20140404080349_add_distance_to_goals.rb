class AddDistanceToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :distance, :float
  end
end
