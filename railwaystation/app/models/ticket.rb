class Ticket < ActiveRecord::Base
    validates :fio, presence: true

    belongs_to :train
    belongs_to :departure_statition, class_name: 'RailwayStation', foreign_key: :departure_statition_id
    belongs_to :arrival_statition, class_name: 'RailwayStation', foreign_key: :arrival_statition_id
    belongs_to :user
end
