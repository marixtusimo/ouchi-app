class RoomsController < ApplicationController
  
  def show
    @room = Room.find(params[:id])
    @message = Message.new
    @messages = @room.messages
    if user_signed_in?
      if @room.user.id == current_user.id
        @owner = @room.owner
      else
        redirect_to root_path    
      end
    elsif owner_signed_in?
      if @room.shop.id == current_owner.id
        @user = @room.user
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def create
    if user_signed_in?
      @room = Room.new(room_owner_params)
      @room.user_id = current_user.id
    elsif owner_signed_in?
      @room = Room.new(room_user_params)
      @room.owner_id = current_owner.id
    else
      redirect_to root_path
    end

    if @room.save
      redirect_to :action => "show", :id => @room.id
    else
      redirect_to root_path
    end
  end

  private
  def room_owner_params
    params.require(:room).permit(:owner_id)
  end

  def room_user_params
    params.require(:room).permit(:user_id)
  end
end
