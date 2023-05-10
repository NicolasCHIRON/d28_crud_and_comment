class CommentsController < ApplicationController

  def create
    @comment = Comment.create!(content: params[:content],gossip_id: params[:gossip_id] ,user_id: User.all.sample.id)
    flash[:notice] = 'Le commentaire a bien été publié'
    redirect_to gossip_path(params[:gossip_id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
