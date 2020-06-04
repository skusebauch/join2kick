class PlayersController < ApplicationController
  def index
    @players = policy_scope(Player)
    if params[:query].present?
      @players = Player.search(params[:query])
   elsif params[:player].present?
      @players = Player.near(current_user.address, params[:player][:location].to_i) if params[:player][:location].present?

      @players_position = []
      # @players = Player.search(params[:player][:position])
      @players_position = @players.where(position: params[:player][:position]) if params[:player][:position] != [""]
      @players_skill = []

      if params[:player][:skill] != [""]
        params[:player][:skill].each do |skill|
          if skill != ""
            @players.each do |player|
              @players_skill << player if player.skill.include?(skill)
            end
          end
        end
      end
      if @players_position.empty?
        @players = [@players + @players_skill].flatten.uniq
      else
        @players = [@players_position + @players_skill].flatten.uniq

      end
      @players.select! do |player|
        player.age(player.birth) <= params[:player][:age].to_i
      end

      @players.select! do |player|
        player.avg_starting >= params[:player][:starting_eleven_avg].to_i
      end

      #@players_age = @players.where(birth: params[:player][:age]) if params[:player][:age].present?
      #@players = Player.near(current_user.address, params[:player][:location]) if params[:player][:location].present?
      #@players = @players.where(starting_eleven_avg: params[:player][:starting_eleven_avg]) if params[:player][:starting_eleven_avg].present?
      #@players = @players.where(league: params[:player][:league]) if params[:player][:league].present?
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
