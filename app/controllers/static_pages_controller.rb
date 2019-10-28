require 'gossip'

class StaticPagesController < ApplicationController
  def team
  end

  def contact
  end
  
  def welcome 
  	params[:gossip_array] = Gossip.all 
  end 

end
