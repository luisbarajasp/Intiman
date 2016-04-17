class PagesController < ApplicationController
  def home
      @sliders = HomeSlider.where('display = ?', true)
      @promotion = Promotion.where('show = ?', true).first
  end

  def about
  end

  def contact
  end
end
