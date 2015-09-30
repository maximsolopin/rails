class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :number
      t.integer :departure_statition_id
      t.integer :arrival_statition_id

      t.timestamps null: false
    end
  end
end
