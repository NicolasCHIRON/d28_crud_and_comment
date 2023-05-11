class CommentsController < ApplicationController

  def create
    @comment = Comment.create!(content: params[:content],gossip_id: params[:gossip_id] ,user_id: User.all.sample.id)
    flash[:notice] = 'Le commentaire a bien été publié'
    redirect_to gossip_path(params[:gossip_id])
  end

  def edit
    @comment = Comment.find(params['id'])
    puts"$"*60
    puts @comment.content
    puts"$"*60
  end

  def update
    @comment = Comment.find(params['id'])
    @path = Gossip.find_by(id: @comment.gossip_id)
    if @comment.update(content: params['comment']['content'])
      flash[:notice] = 'Le commentaire a bien été mis à jour'
      redirect_to @path
    else
      flash[:alert] = @comment.errors.full_messages[0]
      render 'edit'
    end
  end

  def destroy
  end
end
