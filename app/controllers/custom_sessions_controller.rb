class CustomSessionsController < Devise::SessionsController
  #before_filter :find_id_cart, :only => [:before_login, :after_login]
  before_filter :before_login, :only => :create
  after_filter :after_login, :only => :create

  # def find_id_cart
  #     @id_cart = 0
  #     if current_order.order_items.count > 0
  #         @id_cart = current_order.id
  #     end
  # end

  def before_login
      if current_order.order_items.count > 0
          @id_cart = current_order.id
      end
  end

  def after_login
      @user = current_user
      @id_cart = 0
      if current_order.order_items.count > 0
          @id_cart = current_order.id
      end
      if !@user.order.nil?
          if @user.order.order_items.count > 0
              @order = Order.find(@user.order[:id])
              if @id_cart != 0
                  @p_order = Order.find(@id_cart)
                  @p_order.order_items.each do |order_item|
                      order_item.order_id = @order.id
                  end
              end
              session[:order_id] = @order.id
          end
      else
          if @id_cart != 0
              @order = Order.find(@id_cart)
              @order.user_id = @user.id
              @order.save
              session[:order_id] = @order.id
          end
      end

  end
end
