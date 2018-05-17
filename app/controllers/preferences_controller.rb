class PreferencesController < ApplicationController

  before_action :set_buyer
  before_action :set_preference, only: [:edit, :destroy]
  before_action :available_preferences, only: [:new, :create]
  skip_before_action :authenticate_seller!

  def index
    @preferences = policy_scope(Preference)
    # select the preferences already choosen by the buyer
    @buyer_selected_preferences = @preferences.where(buyer_id: current_buyer.id)
  end

  def new
    @preference = Preference.new
    authorize @preference
  end

  def create
    @preference = Preference.new(params_preferences)
    @preference.buyer_id = @buyer.id

    authorize @preference
    if @preference.save
      redirect_to buyer_preferences_path
    else
      render :new
    end
  end

  def destroy
    @preference.destroy
    authorize @preference
    redirect_to buyer_preferences_path
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

  def available_preferences
    # allow to have a list of category_id of preferences that have been selected/not selected by the buyer
    # list of categories id that can be used to build a preference
    @categories = Category.all
    @list_of_all_category_id = @categories.map { |category| category.id }
    # list of preferences already selected by the buyer
    @preferences = Preference.all
    @buyer_selected_preferences = @preferences.where(buyer_id: current_buyer.id)
    # list of preferences selected by a buyer dispalyed by category_id
    @list_of_selected_category_id = @buyer_selected_preferences.map { |preference| preference.category_id }
    # list of preferences not selected by a buyer displayed by category_id
    @list_of_not_selected_category_id = @list_of_all_category_id - @list_of_selected_category_id
  end

end
