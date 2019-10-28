class DynamicPagesController < ApplicationController
  def welcome
    params[:user] = User.find(params[:id]) #POUR LA RECHERCHE EN BDD
  end

  def gossip
  	params[:gossip] = Gossip.find(params[:id])
  end

end
