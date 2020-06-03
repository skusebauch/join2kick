class PlayersController < ApplicationController

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR position ILIKE :query"
      @players = policy_scope(Player.where(sql_query, query: "%#{params[:query]}%"))
    else
      @players = policy_scope(Player)
    end
  end

  def show
   @player = Player.find(params[:id])
   authorize(@player)
  end
end
