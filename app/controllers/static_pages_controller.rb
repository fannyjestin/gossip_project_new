require 'gossip'

class StaticPagesController < ApplicationController
	
  def team
  end

  def contact
  end
  
  def home 
  	params[:gossip_array] = Gossip.all 
  end 


end
