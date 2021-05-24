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

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :station, :price, :access, :describe, :image).merge(owner_id: current_owner.id)
  end
end
