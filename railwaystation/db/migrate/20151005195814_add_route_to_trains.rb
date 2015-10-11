class AddRouteToTrains < ActiveRecord::Migration
  def change
    add_column :trains, :route_id, :number
  end
end
