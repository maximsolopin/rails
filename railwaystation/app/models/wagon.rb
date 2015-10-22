class Wagon < ActiveRecord::Base
    WAGON_TYPES = ["Купейный", "Плацкартный", "СВ", "Сидячий"]

    before_validation :set_number, on: :create

    scope :ordered, -> (direction) { order("number #{direction}") }

    validates :number, presence: true
    validates :number, uniqueness: { scope: :train }, unless: "train.nil?"

    belongs_to :train

    private

    def set_number
      max_number = train.wagons.maximum(:number)
      self.number = max_number ? (max_number + 1) : 1
    end


end
