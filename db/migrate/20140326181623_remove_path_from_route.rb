class RemovePathFromRoute < ActiveRecord::Migration
  def change
    remove_column :routes, :path, :string
  end
end
