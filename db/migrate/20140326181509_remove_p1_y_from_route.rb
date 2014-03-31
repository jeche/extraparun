class RemoveP1YFromRoute < ActiveRecord::Migration
  def change
    remove_column :routes, :p1_y, :string
  end
end
