class Myadmins::ReservationsController < ApplicationController

  skip_before_action :authenticate_buyer!
  layout "sellers"

  def index
    @offer = Offer.find(params[:offer_id])
    @reservations = policy_scope(Reservation).where(offer_id: @offer.id)

    if @reservations.exists?
      @offer = Offer.where(id: @reservations.first.offer_id)
    else
      redirect_to myadmins_offers_path, notice: "Vous n'avez pas encore de reservations pour cette offre"
    end
  end

end



