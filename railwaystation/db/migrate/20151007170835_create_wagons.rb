class CreateWagons < ActiveRecord::Migration
  def change
    create_table :wagons do |t|
      t.integer :train_id

      t.string :wagon_type
      t.integer :top_seats_count
      t.integer :bottom_seats_count

      t.timestamps null: false
    end
  end
end
