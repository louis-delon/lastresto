class ReservationsController < ApplicationController

  skip_before_action :authenticate_seller!
  before_action :set_buyer, only: [ :edit, :update, :destroy]
  before_action :set_reservation, only: [:edit, :update, :destroy]


  def index
    @buyer = current_buyer
    @reservations = policy_scope(Reservation).where(buyer_id: @buyer.id)
  end


  def create
    @offer = Offer.find(params[:offer_id])
    @buyer = current_buyer
    @seller = @offer.seller
    @reservation = Reservation.new(buyer_id: @buyer, offer_id: @offer, seller_id: @seller )
    authorize @reservation
    if @reservation.save
      redirect_to offer_path(@offer)
    else
      render :new
    end
  end

  def edit
    authorize @reservation
  end

  def update
    @offer = @reservation.offer
    @reservation.update
    authorize @reservation
    redirect_to offer_path(@offer)
  end

  def destroy
    @reservation.destroy
    authorize @reservation
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def params_reservation
    params.require(:reservation)
    .permit(
      :time,
      :number_of_persons,
      :buyer_id,
      :seller_id,
      :offer_id
            )
  end

end
