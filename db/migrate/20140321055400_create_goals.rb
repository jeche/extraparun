class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :GoalName
      t.string :GoalTime
      t.string :Route

      t.timestamps
    end
  end
end
