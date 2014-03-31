class AddPointsToRoute < ActiveRecord::Migration
  def change
    add_column :routes, :points, :points
  end
end
