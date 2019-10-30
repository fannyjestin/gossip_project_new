class UsersController < ApplicationController
  def create
  end

  def index
  end

  def show
params[:user] = User.find(params[:id]) #POUR LA RECHERCHE EN BDD
  end
end
