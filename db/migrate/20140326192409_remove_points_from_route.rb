class RemovePointsFromRoute < ActiveRecord::Migration
  def change
    remove_column :routes, :points, :points
  end
end
