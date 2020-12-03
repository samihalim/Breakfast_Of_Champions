class UsersController < ApplicationController

  def show
    @user = User.find_by_username((params[:id]))
    @feedbacks = @user.feedbacks
  end

  def edit
    @user = User.find_by_username((params[:id]))
  end

  def update
    user = User.find_by_username((params[:id]))
    if user.update(user_params)
      redirect_to user_profile_path(current_user.username), notice: 'Your Profile was successfully updated.'
    else
      render :edit
  end

  private

  def user_params
    params.require(:user).permit(:name, :rating, :address)
  end
end






  private


  def feedback_params
    params.require(:feedback).permit(:post_id, :description, :feedback_id,)
  end
