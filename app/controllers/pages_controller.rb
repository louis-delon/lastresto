class PagesController < ApplicationController

skip_before_action :authenticate_buyer!, only: :home

  def home
    @offers = Offer.all
  end

end



#   def home
#     @trips = policy_scope(Trip).where('trips.date > ?', Date.today)
#     @trips = @trips.where(date: params[:date]) if params[:date].present?
#     @trips = @trips.global_search(params[:query]) if params[:query].present?
#   end

#   def page_title
#       "Whikend | Trouvez des partenaires de randonnée!"
#   end

# end
