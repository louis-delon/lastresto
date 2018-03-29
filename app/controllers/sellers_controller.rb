class SellersController < ApplicationController

  skip_before_action :authenticate_seller!, only: [:index, :show]
  before_action :set_seller, only: [:show, :edit, :update]

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

  def set_seller
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

end
