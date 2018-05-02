# require_relative 'sellers/parameter_sanitizer'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_buyer!
  before_action :authenticate_seller!
  # before_action :configure_permitted_parameters, if: :devise_controller?


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

  # def devise_parameter_sanitizer
  #   if resource_class == Seller
  #     Seller::ParameterSanitizer.new(Seller, :seller, params)
  #   else
  #     super # Use the default one
  #   end
  # end

end



