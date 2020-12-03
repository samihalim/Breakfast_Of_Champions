class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    if params[:query].present?
      category = Category.find_by_name(params[:query])
      @posts = category.posts
    else
      @pagy, @posts = pagy(Post.all, items: 15)
    end
    @posts = Post.all.order(updated_at: :desc)
  end

  def show
    @feedback = Feedback.new
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
      p @post.errors.full_messages
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def my_posts
    @posts = current_user.posts
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: 'Post was successfully destroyed.'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params

    params.require(:post).permit(:title, :description, photos: [], category_ids: [])
  end
end
