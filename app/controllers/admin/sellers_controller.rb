module Admin
  class SellersController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    def index
      super
      @resources = Seller.
        page(params[:page]).
        per(30)
    end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Seller.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
