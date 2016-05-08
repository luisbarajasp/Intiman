class UsersController < ApplicationController
    before_action :authenticate_user!

    helper_method :order_items_total

  def order_items_total(order)
      @order = order
      @result = 0
      @order.order_items.each do |item|
          @result += item.quantity
      end
      @result
  end

  def show
      Stripe.api_key = ENV["STRIPE_API_KEY"]

      @order = Order.where('user_id = ? AND order_status_id != 1 AND address IS NOT NULL',current_user.id).order('created_at DESC').first

      if !current_user.customer_id.nil?
          @customer = Stripe::Customer.retrieve(current_user.customer_id)
          
          @cards = Array.new

          @customer.sources.data.each do |card|
              @cards << card
          end



        #   @fDigits =
      end
  end

  def orders
      @orders = Order.where(user_id: current_user.id).order('created_at DESC')
  end

  def likes
      @cloths = current_user.find_liked_items
  end

  def finish_signup
    if request.patch? && params[:user] # Revisa si el request es de tipo patch, es decir, llenaron el formulario y lo ingresaron
      @user = User.find(params[:id])

      if @user.update(user_params)
        sign_in(@user, :bypass => true)
        redirect_to root_path, notice: 'Hemos guardado tu email correctamente.'
      else
        @show_errors = true
      end
    end
  end

  private
    def user_params
      accessible = [ :first_name, :last_name, :email ] # extend with your own params
      accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
      params.require(:user).permit(accessible)
    end
end
