class AddNumberToWagon < ActiveRecord::Migration
  def change
    add_column :wagons, :number, :integer
  end
end
