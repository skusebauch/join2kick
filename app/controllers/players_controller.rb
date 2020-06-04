class PlayersController < ApplicationController
  def index
    @players = policy_scope(Player)
    if params[:query].present?
      @players = @players.search(params[:query])
    elsif params[:player].present?
      @players = Player.near(params[:player].address, params[:player].location)
      @players = @players.search(params[:player])
    end
    # authorize @players
  end

  def show
    @player = Player.find(params[:id])
    authorize(@player)
  end

  def edit
    @player = Player.find(params[:id])
    authorize @player
  end

  def update
    @player = Player.find(params[:id])
    authorize @player
    @club = @player.club
    if @player.update(player_params)
      redirect_to edit_club_path(@club)
    else
      render :edit
    end
  end

  private

  def player_params
    params.require(:player).permit(:salary, :position, :skill, :age, :location, :starting_eleven, :league)
  end
end
