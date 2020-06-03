class ClubsController < ApplicationController
  def show
    @club = Club.find(params[:id])
    authorize @club
    #raise
  end

  def edit
    @club = Club.find(params[:id])
    authorize @club
  end

  def update
    @club = Club.find(params[:id])
    authorize @club
    if @club.update(club_params)
      redirect_to @club
    else
      render :edit
    end
  end

  private

  def club_params
    params.require(:club).permit(:budget)
  end
end
