class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.belongs_to :runnable
      t.belongs_to :route
      t.timestamps
    end
  end
end
