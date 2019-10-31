module SessionsHelper

   def current_user
    User.find_by(id: session[:user_id])
  end

   def login(user)
    session[:user_id] = user.id
  end

  def session_en_cours?
  	(session[:user_id].nil?)? (return false) : (return true)
  end

  def is_owner?
  	()
end
