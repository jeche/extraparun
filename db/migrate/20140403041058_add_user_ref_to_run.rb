class AddUserRefToRun < ActiveRecord::Migration
  def change
    add_reference :runs, :user, index: true
  end
end
