class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :get_categories_brands

  def get_categories_brands
      @categories = Category.all.order('created_at ASC')
      @brands = Brand.all.order('created_at ASC')
      @sizes = Size.all.order('created_at ASC')
      @colors = Color.all.order('created_at ASC')
  end
end
