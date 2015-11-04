class Route < ActiveRecord::Base
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes

  validates :name, presence: true
  validate :stations_count

  before_validation :set_name

  def self.find_stations(from, to)
    routes = Route.joins(:railway_stations_routes).group("routes.id").having("count(distinct railway_stations_routes.railway_station_id) = 2")
    routes.where(["railway_stations_routes.railway_station_id in (?, ?)", from, to]).map(&:id)
  end

  private

  def set_name
    self.name = "#{railway_stations.first.title} - #{railway_stations.last.title}"
  end

  def stations_count
    if railway_stations.size < 2
      errors.add(:base, "Route should contain at least 2 stations")
    end
  end
end
