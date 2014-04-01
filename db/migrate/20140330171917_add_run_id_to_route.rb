class AddRunIdToRoute < ActiveRecord::Migration
  def change
    add_reference :routes, :run, index: true
  end
end
