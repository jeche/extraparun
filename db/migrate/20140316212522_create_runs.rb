class CreateRuns < ActiveRecord::Migration
  def change
    
    create_table :runs do |t|
      t.string :name
      t.string :date
      t.string :dist
      t.string :humidity
      t.string :temp
      t.string :hr
      t.string :min
      t.string :sec

      t.timestamps
    end
  end
end
