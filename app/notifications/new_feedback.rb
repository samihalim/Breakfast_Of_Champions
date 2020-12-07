# To deliver this notification:
#
# CommentNotification.with(post: @post).deliver_later(current_user)
# CommentNotification.with(post: @post).deliver(current_user)

class NewFeedback < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database, format: :to_database
  # deliver_by :email, mailer: "UserMailer"
  deliver_by :action_cable
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
  param :post

  # Define helper methods to make rendering easier.
  #
  def message
    t(".message")
  end

  def url
    post_path(params[:post])
  end
end

#NewFeedback.with(post: Post.first).deliver_later(User.first)
