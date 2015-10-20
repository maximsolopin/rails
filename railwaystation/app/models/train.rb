class Train < ActiveRecord::Base
    TRAIN_SORT_TYPES = ["DESC", "ASC"]

    validates :number, uniqueness: true

    belongs_to :route
    has_many :tickets
    has_many :wagons

    # scope :ordered, -> (train, direction) { where(train: train).order("number #{direction}") }


    def compartment_wagon_count
        self.wagons.select{|wagon| wagon.wagon_type == "Купейный" }.size
    end

    def econom_wagon_count
        self.wagons.select{|wagon| wagon.wagon_type == "Купейный" }.size
    end

    def count_seats
        count_compartments_bottom_seats = 0
        count_compartments_top_seats = 0
        count_reserved_bottom_seats = 0
        count_reserved_top_seats = 0

        self.wagons.each do |wagon|
            if wagon.wagon_type == "Купейный"
                count_compartments_bottom_seats += wagon.bottom_seats_count
                count_compartments_top_seats += wagon.top_seats_count
            elsif wagon.wagon_type == "Плацкартный"
                count_reserved_bottom_seats += wagon.bottom_seats_count
                count_reserved_top_seats += wagon.top_seats_count
            end
        end

        return count_compartments_bottom_seats, count_compartments_top_seats, count_reserved_bottom_seats, count_reserved_top_seats
    end
end
