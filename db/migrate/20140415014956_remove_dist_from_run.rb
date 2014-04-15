class RemoveDistFromRun < ActiveRecord::Migration
  def change
    remove_column :runs, :dists, :string
  end
end
