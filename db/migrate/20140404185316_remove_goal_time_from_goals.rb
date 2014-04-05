class RemoveGoalTimeFromGoals < ActiveRecord::Migration
  def change
    remove_column :goals, :GoalTime, :string
  end
end
