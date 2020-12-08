class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:new, :show, :edit]
  skip_before_action :authenticate_user!, only: [:show]

  def index
  end


  def show
    @feedbacks = Feedback.all
  end

  def new
  end

  def edit
    @post = Post.find(params[:post_id])
    @feedback = Feedback.find(params[:id])
    @feedback.post = @post
  end

  def create
    @post = Post.find(params[:post_id])
    @feedback = Feedback.new(feedback_params)
    @feedback.post = @post
    @feedback.user = current_user

    if @feedback.save
      notification = NewFeedback.with(feedback: @feedback, post: @post)
      notification.deliver(@feedback.post.user)
      redirect_to post_path(@post), notice: 'Feedback was successfully added.'

    else
      redirect_to post_path(@post), notice: @feedback.errors
    end
  end

  def update
    feedback = Feedback.find(params[:id])
    if feedback.update(feedback_params)
      redirect_to post_path(feedback.post), notice: 'Feedback was successfully updated.'
    else
      render :edit
    end
  end


  private

  def set_feedback
    @feedback = Feedback.find(params[:id])
  end

  def feedback_params
    params.require(:feedback).permit(:post_id, :description, :feedback_id,)
  end

end
