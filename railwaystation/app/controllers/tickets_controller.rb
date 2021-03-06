class TicketsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_ticket, only: [:show, :edit, :update, :destroy]
    before_action :railway_station_all

    def index
        @tickets = current_user.tickets
    end

    def show

    end

    def new
        @ticket = Ticket.new
    end

    def create
        @ticket = current_user.tickets.new(ticket_params)

        if @ticket.save
            redirect_to @ticket
        else
            render :new
        end
    end

    def edit

    end

    def update

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
        params.require(:ticket).permit(:number, :departure_statition_id, :arrival_statition_id, :user_id, :train_id)
    end

end
