class PagesController < ApplicationController
  def home
      @sliders = HomeSlider.where('display = ?', true)
  end

  def about
  end

  def contact
  end
end
