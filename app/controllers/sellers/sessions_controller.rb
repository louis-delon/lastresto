# frozen_string_literal: true
class Sellers::SessionsController < Devise::SessionsController
  layout false
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
    # after_sign_in_path_for(seller_path)
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end
  # protected

  protected

  def after_sign_in_path_for(resource)
    seller_path(current_seller)
  end


  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
