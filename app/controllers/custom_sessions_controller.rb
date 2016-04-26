class CustomSessionsController < Devise::SessionsController
  before_filter :before_login, :only => :create
  after_filter :after_login, :only => :create

  $id_cart = 0

  def before_login
      if current_order.order_items.count > 0
          $id_cart = current_order.id
      end
  end

  def after_login
      @user = current_user
      if !@user.order.nil?
          if @user.order.order_items.count > 0
              @order = Order.find(@user.order[:id])
              if $id_cart != 0
                  @p_order = Order.find($id_cart)
                  @p_order.order_items.each do |order_item|
                      order_item.order = @order
                  end
              end
              session[:order_id] = @order.id
          end
      else
          if $id_cart != 0
              @order = Order.find($id_cart)
              @order.user_id = @user.id
              @order.save
              session[:order_id] = @order.id
          end
      end

  end
end
