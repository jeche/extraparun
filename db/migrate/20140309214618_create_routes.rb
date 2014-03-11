class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :p1_x
      t.string :p1_y
      t.string :p2_x
      t.string :p2_y
      t.string :distance

      t.timestamps
    end
  end
end
