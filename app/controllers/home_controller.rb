class HomeController < ApplicationController
    def index
      @chart_data = ChartDataService.chart_data
    end
  
    def about
      @about = "Meez"
    end
  end
  
