class ReservationsController < ApplicationController

  skip_before_action :authenticate_seller!
  before_action :set_buyer, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_reservation, only: [:edit, :update, :destroy]


  def index
    @buyer = current_buyer
    @reservations = policy_scope(Reservation).where(buyer_id: @buyer.id)
  end

  def new
    @reservation = Reservation.new
    authorize @reservation
  end

  def create
    @seller
    @offer = Offer.
    @reservation = Reservation.new(buyer_id: @buyer )
    authorize @reservation
    if @reservation.save
      redirect_to offer_path
    else
      render :new
    end
  end

  def edit
    authorize @reservation

  end

  def update
    @reservation.update
    authorize @reservation
    redirect_to offer_path
  end

  def destroy
    @reservation.destroy
    authorize @reservation
  end

  private

  def set_buyer
    @buyer = Buyer.find(params[:buyer_id])
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

end
