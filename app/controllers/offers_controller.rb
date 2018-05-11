class OffersController < ApplicationController

  before_action :set_offer, only: [:show, :edit, :update, :destroy]
  before_action :set_seller, only: [:edit, :update, :destroy]
  before_action :params_offer, only: [:create, :update]
  # buyer can see an offer in order to make a reservation
  skip_before_action :authenticate_buyer!, except: :show
  # seller must be "signed in" in order to create,update, destroy an offer
  skip_before_action :authenticate_seller!, only: :show
  layout "sellers", except: :show

  def index
    @offers = policy_scope(Offer)
  end

  def new
    @seller = Seller.find(params[:seller_id])
    @offer = Offer.new
    @categories = Category.all.sort_by{ |category| category.name}
    authorize @offer
  end

  def create
    @seller = Seller.find(params[:seller_id])
    @offer = Offer.new(params_offer)
    @offer.seller = @seller
    # @offer.seller = current_seller
    authorize @offer
    if @offer.save
      redirect_to myadmins_offers_path
    else
      render :new
    end
  end

  def edit
    @seller = Seller.find(params[:seller_id])
  end

  def update
    @offer.update(params_offer)
    redirect_to myadmins_offers_path
  end

  def show
    @reservation = Reservation.new
  end

  def destroy
    @offer.destroy
    redirect_to myadmins_offers_path
  end

  private

  def params_offer
    params.require(:offer).permit(
      :title,
      :price,
      :date,
      :duration,
      :description,
      :quantity,
      :seller_id,
      :category_id,
      :image,
      :image_cache
    )
  end

  def set_offer
    @offer = Offer.find(params[:id])
    authorize @offer
  end

  def set_seller
    @seller = Seller.find(params[:seller_id])
  end

end
