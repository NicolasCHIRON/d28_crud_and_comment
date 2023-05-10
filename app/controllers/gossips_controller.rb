class GossipsController < ApplicationController
  def index
    return @params = Gossip.all
  end

  def show
    @gossip = Gossip.find(params['id'])
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(title: params['title'], content: params['content'], user_id: User.all.sample.id)
    if @gossip.save
      flash[:notice] = 'Le gossip a bien été créé'
      redirect_to '/'
    else
      flash[:alert] = @gossip.errors.full_messages[0]
      render 'new'
    end
  end
end
