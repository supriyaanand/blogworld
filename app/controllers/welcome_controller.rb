class WelcomeController < ApplicationController

  def index
    @user = current_user
    @articles = Article.where(user_id: @user.id).order("id desc").limit(5).reverse if !current_user.nil?
  end
end
