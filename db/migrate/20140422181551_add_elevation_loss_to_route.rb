class AddElevationLossToRoute < ActiveRecord::Migration
  def change
    add_column :routes, :elevation_loss, :float
  end
end
