class BuyersController < ApplicationController

  before_action :buyer_is_owner, only: [:edit, :update]

  # to be manage when an admin will be created
  # def index
  # end

  def show
    @buyer = Buyer.find(params[:id])
    @buyer_avatar = @buyer.avatar || "default-avatar.png"
    authorize @buyer
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

  def buyer_is_owner
    @buyer = current_buyer
    authorize @buyer
  end
end
