class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :distance
      t.references :runnable, polymorphic: true
      t.timestamps
    end
  end
end
