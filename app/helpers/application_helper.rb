module ApplicationHelper
  def menu_link_to(link_text, link_path)
    class_name = current_page?(link_path) ? 'menu-item active' : 'menu-item'

    content_tag(:div, class: class_name) do
      link_to link_text, link_path
    end
  end

  def like_or_dislike_btn(post)
    like = Like.find_by(post: post, user: current_user)
    if like
      link_to('Dislike!', post_like_path(id: like.id, post_id: post.id), method: :delete)
    else
      link_to('Like!', post_likes_path(post_id: post.id), method: :post)
    end
  end

  def accept_button(user)
    if current_user.friend_request_pending_from?(@user)
    
    return link_to('Accept request',  user_friendships_path(user, user_id: user.id, requester_id: current_user.id), method: :put)
      nil
    end
  end

  def ignore_button(user)
    if current_user.friend_request_pending_from?(@user)

    return link_to('Decline',  user_friendships_path(user, user_id: user.id, requester_id: current_user.id), method: :delete,)
    nil
    end
  end
end
