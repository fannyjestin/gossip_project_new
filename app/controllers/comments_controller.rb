class CommentsController < ApplicationController

  before_action :authenticate_user, only: [:new, :edit, :update, :create, :destroy]
  before_action :good_user, only: [:edit, :update]

  def index
  end

  def show
  end

  def create
#A CHECKER !!!
      @comment = Comment.new('content' => params[:content], user: User.find(current_user.id), gossip: Gossip.find(params[:gossip_id]))
    if @comment.save
      flash[:success] = "Tu as bien crée ton commentaire ;)"
      redirect_to :controller => 'gossips', :action => 'show', :id => params[:gossip_id]
      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
    else
      redirect_to :action => 'new'
    end
end

  def new
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
    @gossip = Gossip.find(params[:gossip_id])
  end

  def update
    @comment = Comment.find(params[:id])
    comment_param = params.require(:comment).permit(:content)
    if @comment.update(comment_param)
      flash[:success] = "Tu as bien actualisé le commentaire ;)"
      redirect_to :controller => 'gossips',action: 'show', :id => params[:gossip_id]
    
    else
      flash.now[:danger] = "L'actualisation du comment n'a pas fonctionné"
      redirect_to :action => 'edit'
    end
  end

  def destroy
    @comment = Comment.find_by(:gossip_id => params[:id])
    if @comment.destroy
      flash[:success] = "Tu as bien supprimé le commentaire ;)"
      redirect_to :controller => 'gossips', action: "show",  :id => params[:gossip_id]
    else
      flash.now[:danger] = "La suppression du comment n'a pas fonctionné"
      redirect_to action: "show", :id => params[:id]
    end
 end

  def authenticate_user
    unless current_user
      flash[:danger] = "Connecte toi pour accéder à la page :)"
      redirect_to new_session_path
    end
  end 

  def good_user
    unless is_owner?(Comment.find(params[:id]).user_id)
      flash[:danger] = "Tu n'es pas le propriétaire de ce commentaire, tu n'as pas accès à cette fonctionnalité :)"
      redirect_to :controller => 'gossips', action: "show", :id => params[:gossip_id]
    end 
  end 

end 
