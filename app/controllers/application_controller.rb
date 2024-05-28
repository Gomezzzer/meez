class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :set_ransack_search

  private

  def set_ransack_search
    if user_signed_in?
      @q = current_user.recipe_modifiers.ransack(params[:q])
    else
      @q = RecipeModifier.ransack(params[:q])
    end
  end
  skip_forgery_protection
end
