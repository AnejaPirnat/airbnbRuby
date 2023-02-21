class ReservationsController < ApplicationController
    def index
        @reservations = Reservation.find_by(user_id: current_user.id)
    end
    def destroy
        @reservation = Reservation.find(params[:id])
        @reservation.destroy
    end
    def create
        @reservation = Reservation.new(reservation_params)
        @reservation.user = current_user
        @reservation.save
        redirect_to @reservation.post, notice: "Reservation created"
    end
    private
    def reservation_params
        params.require(:reservation).permit(:from, :to, :post_id)
    end
    def new
        @reservation = Reservation.new
    end
end
