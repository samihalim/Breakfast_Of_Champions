class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @feedbacks = @user.feedbacks

  end
end

