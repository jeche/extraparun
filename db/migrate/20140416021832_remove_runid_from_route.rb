class RemoveRunidFromRoute < ActiveRecord::Migration
  def change
    remove_column :routes, :run_id, :integer
  end
end
