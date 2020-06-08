class ClubsController < ApplicationController
  def show
    @club = Club.find(params[:id])
    authorize @club
    current_players = @club.players.all
    @current_players = []
    current_players.each do |player|
      player.statistics.each do |statistic|
        if statistic.tournament.season_year == "2019/2020" && statistic.tournament.tournament_type == "championship"
          @current_players << { player_id: player.id, name: player.name, position: player.position, salary: player.salary,
          current_game_qty: statistic.game_qty, current_goals: statistic.goal_qty,
          current_starting_elv_avg: statistic.starting_eleven_avg }
        end
      end
    end
    # raise
  end

  def edit
    @club = Club.find(params[:id])
    authorize @club
    @players = @club.players
  end

  def update
    @club = Club.find(params[:id])
    authorize @club
    if @club.update(club_params)
      redirect_to edit_club_path(@club)
    else
      render :edit
    end
  end

  private

  def club_params
    params.require(:club).permit(:budget)
  end
end
