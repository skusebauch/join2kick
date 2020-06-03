class PlayersController < ApplicationController

  def index
    @players = policy_scope(Player)
  end

  def show
   @player = Player.find(params[:id])
   authorize(@player)
  end
end
