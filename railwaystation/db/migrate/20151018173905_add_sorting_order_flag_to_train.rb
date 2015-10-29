class AddSortingOrderFlagToTrain < ActiveRecord::Migration
  def change
    add_column :trains, :sorting_order_flag, :string
  end
end
