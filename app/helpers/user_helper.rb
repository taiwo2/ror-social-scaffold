module UserHelper

  def like_btn(user)
    if current_user == user
       render @pending_friends
    
    else
      
      render @mutual_friends 
    end
end
 
end