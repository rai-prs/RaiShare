class RoomsController < ApplicationController
  def index
    @users = User.all
    @rooms = Room.all
  end

  def indexRegistrationList
    @rooms = current_user.rooms
  end

  def show
    @rooms = current_user.rooms.find(params[:id])
    @reservations = Reservation.new
  end

  def new
    @rooms = Room.new
  end

  def create
    @rooms = current_user.rooms.new(room_params)
    if @rooms.save
      redirect_to room_path(@rooms), notice: "部屋を登録しました"
    else
      render "new"
    end
  end

  def edit
    @users = User.find(params[:id])
  end

  def area
    @rooms = Room.where('room_address LIKE ?', "%#{params[:room_address]}%")
  end

  def search
    @rooms = Room.where('room_address LIKE ? OR room_name like ? OR room_introduction like ?', "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%")
  end

  def room_params
    params.require(:room).permit(:room_name, :room_introduction, :room_price, :room_image, :room_address, :user_id)
  end  
end
