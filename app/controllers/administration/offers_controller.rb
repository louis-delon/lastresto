class Administration::OffersController < ApplicationController

  skip_before_action :authenticate_buyer!
  layout "sellers"

def index

end

end

