module UserHelper
  def like_btn(user)
    if current_user == user
      render @pending_friends
    else
      render @mutual_friends
    end
  end

  def accept(user)
    current_user.no_relation?(user) && current_user != user
     
  end

  def cancle(user)
    current_user.friend_request_pending_to?(user)
    link_to('cancle', user_friendships_path(user), method: :delete)
  end

  def inivite(user)
    current_user.friend_request_pending_from?(user)
  end
end
