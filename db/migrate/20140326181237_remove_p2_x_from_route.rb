class RemoveP2XFromRoute < ActiveRecord::Migration
  def change
    remove_column :routes, :p2_x, :string
  end
end
