class Wagon < ActiveRecord::Base
    WAGON_TYPES = ["Купейный", "Плацкартный"]

    belongs_to :train
end
