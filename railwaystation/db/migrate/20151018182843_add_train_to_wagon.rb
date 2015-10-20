class AddTrainToWagon < ActiveRecord::Migration
  def change
    remove_column :wagons, :train_id
    add_belongs_to :wagons, :train
  end
end
