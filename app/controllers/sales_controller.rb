class SalesController < ApplicationController
  def index
      #@cloths = Cloth.where('discount_price != 0').order('created_at DESC')

      #filtering
        conditions = String.new
        wheres = Array.new

        conditions << "discount_price != 0"

        if params.has_key?(:type)
          conditions << " AND " unless conditions.length == 0
          conditions << "type = ?"
          wheres << params[:type]
        end
        if params.has_key?(:make)
          conditions << " AND " unless conditions.length == 0
          conditions << "make = ?"
          wheres << params[:make]
        end
        if params.has_key?(:model)
          conditions << " AND " unless conditions.length == 0
          conditions << "model = ?"
          wheres << params[:model]
        end
        if params.has_key?(:color)
          conditions << " AND " unless conditions.length == 0
          conditions << "color = ?"
          wheres << params[:color]
        end
        if params.has_key?(:price)
          conditions << " AND " unless conditions.length == 0
          conditions << "discount_price < ?"
          wheres << params[:price]
        end
        if params.has_key?(:city)
          conditions << " AND " unless conditions.length == 0
          conditions << "merchants.city = ?"
          wheres << params[:city]
        end

        wheres.insert(0, conditions)

        @cloths = Cloth.where( wheres ).order( "#{params[:sort] or 'created_at'} DESC")

        #render :json => @cloth.as_json()
  end
end
