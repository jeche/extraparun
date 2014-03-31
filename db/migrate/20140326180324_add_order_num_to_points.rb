class AddOrderNumToPoints < ActiveRecord::Migration
  def change
    add_column :points, :orderNum, :integer
  end
end
