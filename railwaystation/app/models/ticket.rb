class Ticket < ActiveRecord::Base


    belongs_to :train, inverse_of: :tickets
    belongs_to :departure_statition, class_name: 'RailwayStation', foreign_key: :departure_statition_id
    belongs_to :arrival_statition, class_name: 'RailwayStation', foreign_key: :arrival_statition_id
    belongs_to :user
end
