class AddPredictionsToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :predictions, :string
  end
end
