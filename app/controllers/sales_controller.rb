class SalesController < ApplicationController
  def index
      @cloths = Cloth.where('discount_price != 0').order('created_at DESC')
  end
end
