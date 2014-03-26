class RemoveP1XFromRoute < ActiveRecord::Migration
  def change
    remove_column :routes, :p1_x, :string
  end
end
