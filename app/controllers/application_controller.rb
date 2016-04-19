class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_order

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  before_action :get_navigation

  def get_navigation
      @categories = Category.all.order('created_at ASC')
      @brands = Brand.all.order('created_at ASC')
      @sizes = Size.all.order('created_at ASC')
      @colors = Color.all.order('created_at ASC')
      @promo = Promotion.where('show = ?', true).first
      if user_signed_in?
          @cloths_liked = current_user.find_liked_items
      end
      @cos = Co.all
      @sis = Si.all
      @order_items = current_order.order_items
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first_name
    devise_parameter_sanitizer.for(:sign_up) << :last_name

    devise_parameter_sanitizer.for(:account_update) << :first_name
    devise_parameter_sanitizer.for(:account_update) << :last_name

  end
end
