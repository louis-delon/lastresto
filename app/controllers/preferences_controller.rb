class PreferencesController < ApplicationController

  before_action :set_buyer
  before_action :set_preference, only: [:edit, :update, :destroy]
  skip_before_action :authenticate_seller!

  def index
    # all the choices of preferences that a buyer can select
    @categories = Category.all
    # select the preferences already choosen by the buyer
    @preferences = policy_scope(Preference).where(buyer_id: current_buyer.id)
    @preferences_by_category = @preferences.map { |preference| preference.category}
    @non_selected_categories = @categories - @preferences_by_category

  end

  def new
    @categories = Category.all
    # select the preferences already choosen by the buyer
    @preferences = policy_scope(Preference).where(buyer_id: current_buyer.id)
    @preferences_by_category = @preferences.map { |preference| preference.category}
    @non_selected_categories = @categories - @preferences_by_category
    @preference = Preference.new
    authorize @preference
  end

  def create
    @preference = Preference.new(params_preferences)
    authorize @preference
  end

  def destroy
    @preference.destroy
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
