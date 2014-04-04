class AddNumPointsToRoute < ActiveRecord::Migration
  def change
    add_column :routes, :numPoints, :integer
  end
end
