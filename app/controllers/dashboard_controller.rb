class DashboardController < ApplicationController
    before_action :authenticate_admin!
    helper_method :order_items_total

    def order_items_total(order)
        @order = order
        @result = 0
        @order.order_items.each do |item|
            @result += item.quantity
        end
        @result
    end

    def index
        @orders = Order.where("order_status_id != 1").order('created_at DESC').limit(4)
        @promotion = Promotion.where('show = ?', true).first
        @sliders = HomeSlider.where('display = ?', true)
    end

    def home_sliders
        @sliders = HomeSlider.all.order('created_at DESC')
    end

    def promotions
        @promotions = Promotion.all.order('created_at DESC')
    end

    def cloths
        @cloths = Cloth.all.order('created_at DESC')
    end

    def orders
        @p_orders = Order.where(order_status_id: 2).order('created_at DESC').limit(4)
        @s_orders = Order.where(order_status_id: 3).order('created_at DESC').limit(4)
        @c_orders = Order.where(order_status_id: 4).order('created_at DESC').limit(4)
    end
end
