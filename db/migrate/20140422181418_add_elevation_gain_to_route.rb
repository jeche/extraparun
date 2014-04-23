class AddElevationGainToRoute < ActiveRecord::Migration
  def change
    add_column :routes, :elevation_gain, :float
  end
end
