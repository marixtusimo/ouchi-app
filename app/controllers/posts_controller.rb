class PostsController < ApplicationController
  def index
    if user_signed_in?
      @owners = Owner.all
      rooms = current_user.rooms
      @owner_ids = []
      rooms.each do |r|
        @owner_ids << r.owner_id
      end

    elsif owner_signed_in?
      @users = User.all
      rooms = current_owner.rooms
      @user_ids = []
      rooms.each do |r|
        @user_ids << r.user_id
      end
    end
  end
end
