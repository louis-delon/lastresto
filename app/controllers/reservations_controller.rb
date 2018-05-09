class ReservationsController < ApplicationController

  skip_before_action :authenticate_seller!
  before_action :set_buyer, only: [:create, :edit, :update, :destroy]
  before_action :set_reservation, only: [:edit, :update, :destroy]

  def index
    @buyer = current_buyer
    @reservations = policy_scope(Reservation).where(buyer_id: @buyer.id)
    # @reservations = Reservation.all.where(buyer_id: @buyer.id)
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = reservation.new
    authorize @reservation
    if reservation.save?
      redirect_to buyer_reservations_path(@buyer)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @reservation.update
    redirect_to buyer_reservations_path(@buyer)
  end

  def destroy
    @reservation.destroy
  end

  private

  def set_buyer
    @buyer = Buyer.find(params[:buyer_id])
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

end
