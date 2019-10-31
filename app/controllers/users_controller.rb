class UsersController < ApplicationController
  def create
    puts "$" * 60
    puts "ceci est le contenu de params :"
    puts params
    puts "$" * 60

    #FAIRE CONDITION POUR LA VILLE

    @user = User.new(
                   city_id: params[:ville], #A DEFINIR
                   email: params[:email],
                   password: params[:password],
                   first_name: params[:first_name],
                   last_name: params[:last_name],
                   description: params[:description],
                   age: params[:age])
    if @user.save
      flash[:success] = "Compte crée !"
      redirect_to sessions_new_path

#else renvoie a la page de login avec message d'erreur

#UNE FOIS CO, TROUVER LES INFOS AVEC User.find(session[:user_id])
    else 
      render "new"
    end

  end 


  def index
  end

  def show
    @user = User.find(params[:id]) #POUR LA RECHERCHE EN BDD
    @city = City.find(@user.city_id)
    @nb_gossips = Gossip.where(user_id: @user.id).count
    @nb_comments = Comment.where(user_id: @user.id).count
    @gossips_arrray = Gossip.where(user_id: @user.id)

  end


  def new
  end


end
