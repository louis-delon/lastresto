class SellersController < ApplicationController

  skip_before_action :authenticate_seller!, only: [:index, :show]
  before_action :seller_is_owner, only: [:edit, :update]
  before_action :set_seller, only: [:show]

  def index
    @sellers = policy_scope(Seller).order(created_at: :desc)
  end

  def show
    @seller_avatar = @seller.avatar || "default-avatar.png"
  end

  def edit
  end

  def update
    @seller.update(seller_params)
    redirect_to seller_path(@seller)
  end

  private

  def set_ser
    @seller = Seller.find(params[:id])
    authorize @seller
  end

  def seller_params
    params.require(:seller).permit(
      :name,
      :address,
      :zip_code,
      :city,
      :phone_number,
      :avatar
    )
  end

  def seller_is_owner
    @seller = current_seller
    authorize @seller
  end
