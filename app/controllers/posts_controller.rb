class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
    @feedbacks = Feedback.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save!
      redirect_to @post, notice: 'A post was successfully created.'

    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'post was successfully updated.'
    else
      render :edit
    end
  end

  def my_posts
    @posts = current_user.posts
  end

  def destroy
    @post.destroy
    redirect_to postss_url, notice: 'post was successfully destroyed.'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params

    params.require(:post).permit(:title, :description, photos: [], category_ids: [])
  end
end
