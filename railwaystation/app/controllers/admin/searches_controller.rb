class Admin::SearchesController < Admin::BaseController
    def show
        @stations = RailwayStation.all
        if (params[:departure_statition] != nil)
            @departure_statition = RailwayStation.find(params[:departure_statition])
            @arrival_statition   = RailwayStation.find(params[:arrival_statition])
            routes = Route.find_stations(@departure_statition, @arrival_statition)
            @trains = Train.find_trains(routes)
        end
    end

    def new
        @search = Search.new
    end
end
