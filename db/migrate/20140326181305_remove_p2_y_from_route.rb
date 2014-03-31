class RemoveP2YFromRoute < ActiveRecord::Migration
  def change
    remove_column :routes, :p2_y, :string
  end
end
