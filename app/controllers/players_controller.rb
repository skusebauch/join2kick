class PlayersController < ApplicationController
  # before_action :set_conversations, only: :show
  def index
    @players = policy_scope(Player).where.not(user: current_user)
    if params[:query].present?
      @search_mode = true
      @players = Player.search(params[:query])
    elsif params[:player].present?
      @search_mode = true
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

      tournament = Tournament.find_by(league: params[:player][:league], season_year: params[:player][:season_year])
      @players.select! do |player|
        player.tournaments.include?(tournament)
      end
    end
    # authorize @players
  end

  def show
    @player = Player.find(params[:id])
    authorize(@player)
    @user = @player.user
    authorize(@user)
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

  def set_conversations
    @conversations = Conversation.where(sender_id: current_user).or(Conversation.where(receiver_id: current_user))
    @conversations = policy_scope(@conversations)
  end
end
