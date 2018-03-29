class PagesController < ApplicationController

skip_before_action :authenticate_buyer!, only: :home

  def home
  end

end
