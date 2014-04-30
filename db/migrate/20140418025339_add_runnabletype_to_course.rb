class AddRunnabletypeToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :runnable_type, :string
  end
end
