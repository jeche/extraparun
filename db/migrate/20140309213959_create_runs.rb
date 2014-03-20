class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.string :runId
      t.string :hr
      t.string :min
      t.string :sec
      t.string :date

      t.timestamps
    end
  end
end
