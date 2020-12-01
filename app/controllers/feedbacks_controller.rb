class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:new, :show]
  skip_before_action :authenticate_user!, only: [:show]

  def index
  end


  def show
    @feedbacks = Feedback.all
  end

  def new
  end

  def edit
  end

  def create
    @post = Post.find(params[:post_id])
    @feedback = Feedback.new(feedback_params)
    @feedback.post = @post
    @feedback.user = current_user

    if @feedback.save!
      redirect_to post_path(@post), notice: 'A feedback was successfully created.'

    else
      render :new
    end
  end

  def update
    if @feedback.update(feedback_params)
      redirect_to @post, notice: 'Feedback was successfully updated.'
    else
      render :edit
    end
  end


  private

  def set_feedback
    @feedback = Feedback.find(params[:id])
  end

  def feedback_params
    params.require(:feedback).permit(:post_id, :description)
  end

end
