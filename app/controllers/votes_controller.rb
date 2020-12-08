class VotesController < ApplicationController
  def create
    @feedback = Feedback.find(params[:feedback_id])
    @vote = Vote.new()
    @vote.user = current_user
    @vote.feedback = @feedback

    if @vote.save
      redirect_to post_path(@feedback.post)
      flash[:notice] = "Succesfully added an upvote"
    else
      redirect_to post_path(@feedback.post)
      flash[:alert] = "Something went wrong, please try again"
    end
  end

  def destroy
    @feedback = Feedback.find(params[:feedback_id])
    @vote = Vote.find(params[:id])

    if @vote.destroy
      redirect_to post_path(@feedback.post)
      flash[:notice] = "Succesfully added a downvote"
    else
      redirect_to post_path(@feedback.post)
      flash[:alert] = "Something went wrong, please try again"
    end
  end
end
