class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.float :lat
      t.float :lon

      t.timestamps
    end
  end
end
