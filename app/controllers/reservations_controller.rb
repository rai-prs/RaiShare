class ReservationsController < ApplicationController

  def index
    @reservations = current_user.reservations
    @rooms = current_user.rooms
  end

  def show
    @reservations = current_user.reservations.find(params[:id])
    @rooms = current_user.rooms.find(params[:room_id])
  end

  def create
    @reservations = Reservation.new(params.require(:reservation).permit(:room_start_date, :room_end_date, :room_number, :room_id, :user_id, :room_price, :reservation_room_price))
    @rooms = @reservations.room
    if params[:back] || !@reservations.save
      render template: "rooms/show" and return
    else
      redirect_to room_reservation_path(@reservations.room_id, @reservations), notice: "予約が完了しました"
    end
  end

  def confirm
    @reservations = Reservation.new(params.permit(:room_start_date, :room_end_date, :room_number, :room_id, :user_id, :room_price, :reservation_room_price))
    @rooms = Room.find(params[:room_id])
    if @reservations.invalid?
      render template: "rooms/show" and return
    end
    @days = (@reservations.room_end_date - @reservations.room_start_date).to_i
    @price = @days * @rooms.room_price * @reservations.room_number
  end


  def reservation_params
   params.require(:reservation).permit(:room_start_date, :room_end_date, :room_number, :room_id, :user_id, :room_price, :reservation_room_price, :id)
  end 
end
