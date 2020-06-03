class ApplicationController < ActionController::Base
  # [...]
  before_action :authenticate_user!# , :check_signed_in?
  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def check_signed_in?
    redirect_to club_path(params[:user_id]) if signed_in?
  end
end
