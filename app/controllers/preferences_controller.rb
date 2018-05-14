class PreferencesController < ApplicationController

  before_action :set_buyer
  before_action :set_preference, only: [:edit, :update, :destroy]
  skip_before_action :authenticate_seller!

  def index
    @preferences = policy_scope(Preference).where(buyer_id: current_buyer.id)
  end

  def new
    @preference = Preference.new
    @categories = Category.all
    authorize @preference
  end

  def create
    @preference = Preference.new
    @categories = Category.all
    authorize @preference
  end

  def edit

    authorize @preference
  end

  def update
    @preference.update(params)
    authorize @preference
  end

  def destroy
    authorize @preference
  end


  private

  def params_preferences
    params.require(:preference).permit(:buyer_id, :category_id)
  end

  def set_buyer
    @buyer = Buyer.find(params[:buyer_id])
  end

  def set_preference
    @preference = Preference.find(params[:id])
  end

end
