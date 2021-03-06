class PostsController < ApplicationController
  before_action :authenticate_owner!, except: [:show, :index, :search]#サインインしていなくても閲覧可能
  before_action :set_post, only: [:show, :edit, :update, :destroy]#一緒のコードを一つにまとめる
  before_action :set_item, only: [:index, :search]#一緒のコードを一つにまとめる
  def index
    if user_signed_in?
      @owners = Owner.all
      @owner = Owner.all
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
  end

  def edit
    redirect_to root_path unless current_owner.id == @post.owner_id
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def search
    @posts = Post.search(params[:keyword])
  end

  private

  def post_params
    params.require(:post).permit(:title, :station, :price, :access, :describe, :image).merge(owner_id: current_owner.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_item
    @owner = Owner.all
  end
end
