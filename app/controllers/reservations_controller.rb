class ReservationsController < ApplicationController

  # Reservations are only for buyers
  skip_before_action :authenticate_seller!
  before_action :set_reservation, only: [:edit, :update, :destroy]


  def index
    @buyer = current_buyer
    @reservations = policy_scope(Reservation).where(buyer_id: @buyer.id)
  end

  def create
    @offer = Offer.find(params[:offer_id])
    @buyer = current_buyer
    @reservation = Reservation.new(params_reservation)
    @reservation.buyer_id = @buyer.id
    @reservation.offer_id = @offer.id
    authorize @reservation
    if @reservation.save
      redirect_to root_path, notice: "votre reservation a été validée"
    else
      render :new
    end
  end

  def edit
    authorize @reservation
  end

  def update
    @reservation.update(params_reservation)
    authorize @reservation
    redirect_to root_path
  end

  def destroy
    @offer = @reservation.offer
    @reservation.offer_id = @offer.id
    @reservation.destroy
    authorize @reservation
    redirect_to offer_reservations_path(@offer), notice: "Votre réservation a été annulée"
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
      :offer_id,
      :comment
            )
  end

end
