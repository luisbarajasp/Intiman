class SalesController < ApplicationController
  def index

      #filtering
        # conditions = String.new
        # wheres = Array.new
        #
        # conditions << "discount_price != 0"
        #
        # if params.has_key?(:size)
        #   conditions << " AND " unless conditions.length == 0
        #   conditions << "? IN (sizes)"
        #   wheres << params[:size]
        # end
        # if params.has_key?(:discount_price)
        #   conditions << " AND " unless conditions.length == 0
        #   conditions << "discount_price < ?"
        #   wheres << params[:discount_price]
        # end
        # if params.has_key?(:normal_price)
        #   conditions << " AND " unless conditions.length == 0
        #   conditions << "normal_price < ?"
        #   wheres << params[:normal_price]
        # end
        # if params.has_key?(:color)
        #   conditions << " AND " unless conditions.length == 0
        #   conditions << "? IN (colors)"
        #   wheres << params[:color]
        # end
        # if params.has_key?(:brand)
        #   conditions << " AND " unless conditions.length == 0
        #   conditions << "brand_n = ?"
        #   wheres << params[:brand]
        # end
        # if params.has_key?(:category)
        #   conditions << " AND " unless conditions.length == 0
        #   conditions << "category_n = ?"
        #   wheres << params[:category]
        # end
        #
        # wheres.insert(0, conditions)

        @cloths = Cloth.order( "#{params[:sort] or 'created_at'} #{params[:order] or 'DESC'}")

        @cloths = @cloths.select { |c| c.sizes_n.include? params[:size] } if params[:size]
        @cloths = @cloths.where('brand_n = ?', params[:brand]) if params[:brand]
        @cloths = @cloths.where('category_n = ?', params[:category]) if params[:category]
        @cloths = @cloths.select { |c| c.colors_n.include? params[:color] } if params[:color]
        @cloths = @cloths.where('discount_price < ?', params[:price]) if params[:price]

        @cos = Co.all
        @sis = Si.all
  end
end
