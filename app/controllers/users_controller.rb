class PlayersController < ApplicationController

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  private

  def user_params
    params.require(:user).permit(:photo)
  end

end
