class PagesController < ApplicationController
  def home
      @sliders = HomeSlider.where('display = ?', true)
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
