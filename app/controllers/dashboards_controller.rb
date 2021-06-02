class DashboardsController < ApplicationController
  def index
    @well = WhatWentWell.all
    @wrong = WhatWentWrong.all
    @improve = Improvement.all
  end

  def newWhatWentWell
    #binding.pry
    @wentwell = WhatWentWell.new
  end

  def createWhatWentWell
    binding.pry
    @wentwell = WhatWentWell.new(body:dashboard_params)

    if @wentwell.save
      redirect_to :controller => 'dashboard_controller', :action => 'index'
    else
      render :new
    end
  end

  private
    def dashboard_params
      params.require(:WhatWentWell).permit(:body)
    end
end
