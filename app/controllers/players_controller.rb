class PlayersController < ApplicationController

  def index
    @players = Player.all
    authorize @players
  end

  def show
   @player = Player.find(params[:id])
  end
end
