require_relative 'sellers/parameter_sanitizer'
require_relative 'buyers/parameter_sanitizer'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_buyer!
  before_action :authenticate_seller!

  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  def pundit_user
    # allow to setup pundit according to users status
    CurrentContext.new(current_seller, current_buyer)
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  protected

  def devise_parameter_sanitizer
    # allow to set up strong parameter for buyers and sellers according to each situation
    if resource_class == Seller
      Sellers::ParameterSanitizer.new(Seller, :seller, params)
    elsif resource_class == Buyer
      Buyers::ParameterSanitizer.new(Buyer, :buyer, params)
    else
      super # Use the default one
    end
  end

end




