class AddIndexesToTickets < ActiveRecord::Migration
  def change
    add_index :tickets, :train_id
    add_index :tickets, :departure_statition_id
    add_index :tickets, :arrival_statition_id
    add_index :tickets, :user_id
  end
end
