class RemoveRunnabletypeFromRoute < ActiveRecord::Migration
  def change
    remove_column :routes, :runnable_type, :string
  end
end
