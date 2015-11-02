class Admin::WagonsController < Admin::BaseController
    before_action :set_train, only: [:new, :create]
    before_action :set_wagon, only: [:show, :edit, :update, :destroy]

    def index
        @wagons = Wagon.all
    end

    def new
        @wagon = Wagon.new
    end

    def show
    end

    def create
        @wagon = @train.wagons.new(wagon_params)

        if @wagon.save
          redirect_to @train
        else
          render :new
        end
    end

    def edit
    end

    def update
        if @wagon.update(wagon_params)
          redirect_to @wagon
        else
          render :edit
        end
    end

    def destroy
        @wagon.destroy
        redirect_to @wagon.train
    end

    protected

    def set_train
        @train = Train.find(params[:train_id])
    end

    def set_wagon
        @wagon = Wagon.find(params[:id])
    end

    def wagon_params
        params.require(:wagon).permit(:wagon_type, :top_seats_count, :bottom_seats_count, :number, :side_top_seats_count, :side_bottom_seats_count)
    end
end
