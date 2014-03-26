class AddRouteRefToPoint < ActiveRecord::Migration
  def change
    add_reference :points, :route, index: true
  end
end
