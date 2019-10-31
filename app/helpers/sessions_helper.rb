module SessionsHelper

   def current_user
    User.find_by(id: session[:user_id])
  end

   def login(user)
    session[:user_id] = user.id
  end


end
