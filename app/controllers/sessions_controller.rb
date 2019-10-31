class SessionsController < ApplicationController
  def new
  end
#page de login où l'on demande MDP et email

  def create
  	user = User.find_by(email: params[:email])
  
#processs d'indentification, cherche s'il existe un user en base avec l'email

#if ok stockage de l'info dans session[:user_id] = user.id
    if user && user.authenticate(params[:password])
    	session[:user_id] = user.id
      flash[:success] = "Connexion réussie"
      redirect_to "/"

#else renvoie a la page de login avec message d'erreur
	else 
		flash.now[:danger] = "Email/Mot de Passe invalides"
		render "new"
#UNE FOIS CO, TROUVER LES INFOS AVEC User.find(session[:user_id])
	end 
  end

  def destroy
     puts "*" * 60
     session.delete(:user_id)
     puts "*" * 60
    flash[:success] = "Deconnexion réussie"
    redirect_to root_path
  end
end
