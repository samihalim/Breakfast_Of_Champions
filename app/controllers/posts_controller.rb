class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    if params[:query].present?
      sql_query = " \
        posts.title ILIKE :query \
        OR posts.description ILIKE :query \
        OR categories.name ILIKE :query \
      "
      @pagy, @posts = pagy(Post.joins(:categories).where(sql_query, query: "%#{params[:query]}%"), items: 15)
    else
      @pagy, @posts = pagy(Post.all.order(updated_at: :desc), items: 15)
    end
    @categories = Category.all
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
    UserChannel.broadcast_to(
      @post.user, "test"
    )
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
    redirect_to user_profile_path(current_user.username), notice: 'Post was successfully destroyed.'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, photos: [], category_ids: [])
  end
end
