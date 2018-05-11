class PreferencesController < ApplicationController

  before_action :set_buyer

  def index
    @preferences = Preference.all
  end

  def new
    @preference = Preference.new
  end

  def create
    @preference = Preference.new
    @categories = Category.all
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def show
  end

  private

  def params_preferences
    params.require(:preference).permit(:buyer_id, :category_id)
  end

  def set_buyer
    @buyer = Buyer.find(params[:buyer_id])
  end

end
