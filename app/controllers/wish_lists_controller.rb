class WishListsController < ApplicationController
  skip_after_action :verify_authorized
  def show
    @wish_list = WishList.find(params[:id])
  end

  def index
    @wish_lists = WishList.where(user_id: current_user)
    policy_scope(@wish_lists)
  end

  def create
    # @wish_list = WishList.new(wish_list_params)

    @wish_list = WishList.new
    @player = Player.find(params[:player_id])
    @wish_list.user = current_user
    @wish_list.player = @player
    authorize @wish_list
    if @wish_list.save
      redirect_to player_path(@player)
    else
      render "wish_lists/show"
    end
  end

  def destroy
    @club = current_user.club
    @wish_list = WishList.find(params[:id])
    @wish_list.destroy
    redirect_to club_path(@club)
    authorize @wish_list
  end

  private
  def wish_list_params
    params.require(:wish_list).permit(:player_id, :user_id)
  end
end
