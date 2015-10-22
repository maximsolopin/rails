class AddSideSeatsToWagon < ActiveRecord::Migration
  def change
    add_column :wagons, :side_top_seats_count, :integer
    add_column :wagons, :side_bottom_seats_count, :integer
  end
end
