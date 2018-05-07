class ReservationsController < ApplicationController

  skip_before_action :authenticate_seller!

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
    if reservation.save?
      redirect_to
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
