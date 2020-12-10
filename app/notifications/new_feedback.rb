# To deliver this notification:
#
#NewFeedback.with(post: Post.first).deliver_later(User.first)
# CommentNotification.with(post: @post).deliver_later(current_user)
# CommentNotification.with(post: @post).deliver(current_user)

class NewFeedback < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database, format: :to_database
  # deliver_by :email, mailer: "UserMailer"
  deliver_by :action_cable, channel: 'UserChannel'
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  def to_database
    {
      type: self.class.name,
      params: params,
      #account: Current.account
    }
  end

  # Add required params
  #
  param :feedback

  # Define helper methods to make rendering easier.
  #
  def message
    "#{t(".message")} #{Feedback.find(params[:feedback].id).post.title.capitalize}"
  end

  def url(*args, **kwargs)
    if params[:post].present?
      post_path(params[:post],*args, **kwargs)
    else
      @feedback = Feedback.find(params[:feedback].id)
      post_path(@feedback.post,*args, **kwargs)
    end
  end
end
