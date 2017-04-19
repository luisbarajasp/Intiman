class PagesController < ApplicationController
  def home
      @sliders = HomeSlider.where('display = ?', true)
      @cloths = Cloth.order('created_at DESC').first(4)
      @sizes = Size.order('created_at ASC')
  end

  def home_static
  end

  def about
  end

  def contact
  end

  def help
  end

  def legal
  end
end
