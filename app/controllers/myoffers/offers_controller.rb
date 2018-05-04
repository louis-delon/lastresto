class Myoffers::OffersController < ApplicationController

  skip_before_action :authenticate_buyer!
  layout "sellers"

  def index
    @offers = policy_scope(Offer)
  end

end
