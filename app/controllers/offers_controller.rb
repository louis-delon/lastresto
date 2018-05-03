class OffersController < ApplicationController

  before_action :set_offer, only: [:show,:edit, :update]
  before_action :params_offer, only: [:create, :update]
  skip_before_action :authenticate_buyer!
  layout "sellers"

  def index
    @offers = policy_scope(Offer)
  end

  def new
    @seller = Seller.find(params[:seller_id])
    @offer = Offer.new
    authorize @offer
  end

  def create
    @seller = Seller.find(params[:seller_id])
    @offer = Offer.new(params_offer)
    authorize @offer

    if @offer.save
      redirect_to administration_offers_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @offer.update(params_offer)
  end

  def show

  end

  def destroy
    @offer.destroy
    redirect_to root_path
  end

  private

  def params_offer
    params.require(:offer).permit(
      :title,
      :price,
      :date,
      :duration,
      :description,
      :file,
      :quantity,
      :seller_id,
      :category_id,
      :image
    )
  end

  def set_offer
    @offer = Offer.find(params[:id])
    authorize @offer
  end

end
