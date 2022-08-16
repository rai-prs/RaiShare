class UsersController < ApplicationController
  def index
    @users = User.all
    @rooms = Room.all
  end

  def show
    @users = User.find(params[:id])
  end

  def new
  end

  def edit
    @users = User.find(params[:id])
  end

  def update
    @users = User.find(params[:id])
    if @users.update(user_params)
      redirect_to edit_user_path, notice: "プロフィールを更新しました。"
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :self_introduction, :image, :encrypted_password)
  end  


  
end
