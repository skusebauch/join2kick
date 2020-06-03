class ClubsController < ApplicationController
  def show
    @club = Club.find(params[:id])
    authorize @club
    #raise
  end
end
