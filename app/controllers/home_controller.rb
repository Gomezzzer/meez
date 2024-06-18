class HomeController < ApplicationController
  def index
      @chart_data = ChartDataService.chart_data
  end

  # extra line between actions
  def about
      @about = "Meez"
  end
  # indent was off
end
