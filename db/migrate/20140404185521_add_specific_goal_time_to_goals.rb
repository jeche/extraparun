class AddSpecificGoalTimeToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :gtHour, :integer
    add_column :goals, :gtMin, :integer
    add_column :goals, :gtSec, :integer
  end
end
