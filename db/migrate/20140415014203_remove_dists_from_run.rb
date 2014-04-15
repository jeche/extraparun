class RemoveDistsFromRun < ActiveRecord::Migration
  def change
    remove_column :runs, :dist, :string
  end
end
