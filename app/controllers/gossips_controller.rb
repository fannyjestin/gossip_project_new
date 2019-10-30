class GossipsController < ApplicationController

  def index
    params[:gossip_array] = Gossip.all 
   puts "##" *60
      	puts params[:gossip_array]
  end


  def new
  end

  def create
    puts "$" * 60
    puts "ceci est le contenu de params :"
    puts params
    puts "$" * 60
    @gossip = Gossip.new(
                   title: params[:gossip_title],
                   content: params[:gossip_content],
                   user_id: 1)

  
  if @gossip.save
    redirect_to :action => 'index', notice: "Bravo, vous avez enregitré votre potin!"
#redirect mettre action, render mettre juste la methode
  else
    render "new"
  end 

end


  def edit
    @gossip = Gossip.find(params[:id])
  end
#façon d'écrire un formulaire qui correspond à un modele en particulier form_for :
#prend en compte le gossip qu'on doit modifier
#l'URL vers laquelle on doit rediriger

  def update
    @gossip = Gossip.find(params[:id])
    gossip_params = params.require(:gossip).permit(:title, :content)
    @gossip.update(gossip_params)
    redirect_to action: "show"
  end



  def show
     @gossip = Gossip.find(params[:id])
  end



  def destroy
     @gossip = Gossip.find(params[:id])
     puts "*" * 60
     @gossip.destroy
     puts "*" * 60
     redirect_to :action => "index"

  end

end
