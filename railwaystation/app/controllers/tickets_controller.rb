class TicketsController < ApplicationController
    before_action :set_ticket, only: [:show, :edit, :update, :destroy]
    before_action :set_user

    def index
        @tickets = @user.tickets
    end

    def show

    end

    def new
        @ticket = Ticket.new
    end

    def create
        @ticket = Ticket.new(ticket_params)

        if @ticket.save
            redirect_to [@user, @ticket]
        else
            render :new
        end
    end

    def edit
        @railway_station_all = RailwayStation.all
    end

    def update
        if @ticket.update(ticket_params)
            redirect_to [@user, @ticket]
        else
            render :new
        end
    end

    def destroy
        @ticket.destroy
        redirect_to tickets_path
    end

    def railway_station_all
        @railway_station_all = RailwayStation.all
    end

    private

    def set_ticket
        @ticket = Ticket.find(params[:id])
    end

    def ticket_params
        params.require(:ticket).permit(:number, :departure_statition_id, :arrival_statition_id, :fio, :user_id, :train_id)
    end

    def set_user
        @user = User.find(params[:user_id])
    end
end
