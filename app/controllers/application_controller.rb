class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #helper_method :current_order

  def current_order
    if user_signed_in?
        @current_order ||= Order.where(user: current_user).order('created_at DESC').first
        if @current_order
            if @current_order.order_status_id != 1
                session[:order_id] = nil
                @current_order = Order.new
                @current_order.user = current_user
                session[:order_id] = @current_order.id
            else
                session[:order_id] = @current_order.id
            end
        else
            @current_order = Order.new
            @current_order.user = current_user
            session[:order_id] = @current_order.id
        end
    else
        if session[:order_id]
          @current_order ||= Order.find(session[:order_id])
          session[:order_id] = nil if @current_order.order_status_id != 1
        end
        if session[:order_id].nil?
          @current_order = Order.new
          session[:order_id] = @current_order.id
        end
    end
    @current_order
  end

  #before_action :get_navigation

  def get_navigation
      @categories = Category.all.order('created_at ASC')
      @brands = Brand.all.order('created_at ASC')
      @sizes = Size.all.order('created_at ASC')
      @colors = Color.all.order('created_at ASC')
      @promo = Promotion.where('show = ?', true).first
      if user_signed_in?
          @cloths_liked = current_user.find_liked_items.first(5)
          @notifications = UNotification.where(user: current_user).unread
      end
      if admin_signed_in?
          @notifications = ANotification.where(admin: current_admin).unread
      end
      @cos = Co.all
      @sis = Si.all
      @order_items = OrderItem.where(order_id: current_order.id)
  end

  #before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first_name
    devise_parameter_sanitizer.for(:sign_up) << :last_name

    devise_parameter_sanitizer.for(:account_update) << :first_name
    devise_parameter_sanitizer.for(:account_update) << :last_name
  end

  def authenticate_admin!
    redirect_to root_path unless admin_signed_in?
  end

  def authenticate!
      unless user_signed_in? || admin_signed_in?
          redirect_to new_user_session_path
          flash[:alert] = "Necesitas ingresar o registrarte para continuar."
      end
  end

  # def authenticate_user!
  #     unless user_signed_in? || admin_signed_in?
  #         redirect_to new_user_session_path
  #         flash[:alert] = "Necesitas ingresar o registrarte para continuar."
  #     end
  # end
end
