class ReservationsController < ApplicationController
    def index
        @reservations = Reservation.find_by(user_id: current_user.id)
    end

    def create
        @reservation = @reservation.new(reservation_params)
        @reservation.user = current_user
        @reservation.post = Post.find(params[:post_id])
        @reservation.save
    end
    def destroy
        @reservation = Reservation.find(params[:id])
        @reservation.destroy
        redirect_to reservations_path
    end
    
end
private
    def reservation_params
        params.require(:reservation).permit(:start_date, :end_date, :post_id)
    end
