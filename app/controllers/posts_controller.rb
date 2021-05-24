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
    @posts = Post.all
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

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  
  private

  def post_params
    params.require(:post).permit(:title, :station, :price, :access, :describe, :image).merge(owner_id: current_owner.id)
  end
end