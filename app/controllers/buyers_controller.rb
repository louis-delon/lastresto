class BuyersController < ApplicationController

  before_action :set_buyer, only: [:show, :edit, :update]
  skip_before_action :authenticate_seller!


  # to be manage when an admin will be created
  def index
  end

  def show
    @buyer_avatar = @buyer.avatar || "default-avatar.png"
  end

  def edit
  end

  def update
    @buyer.update(buyer_params)
    redirect_to buyer_path(@buyer)
  end

  private

  def buyer_params
    params.require(:buyer).permit(
      :pseudo,
      :first_name,
      :last_name,
      :phone,
      :avatar
    )
  end

  def set_buyer
    @buyer = Buyer.find(params[:id])
    authorize @buyer
  end

end
