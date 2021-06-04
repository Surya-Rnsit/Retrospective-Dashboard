class DashboardsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @well = WhatWentWell.all
    @wrong = WhatWentWrong.all
    @improve = Improvement.all
  end


  def createWhatWentWell
    @wentwell = WhatWentWell.new(body: params[:body])  
    if @wentwell.save
      redirect_to dashboards_path
    else
      render json: { errors: @wentwell.errors.full_messages }, status: 500
    end
  end
  
  
  #def editWhatWentWell
  #@editWell = WhatWentWell.find(params[:id])
  #end



  def updateWhatWentWell
    @editWell = WhatWentWell.find(params[:id])
    binding.pry
    if @editWell.update(body: params[:body])
      redirect_to dashboards_path
    else
      render json: { body:@editWell ,errors: @editWell.errors.full_messages }, status: 500
    end
  end

  

  def destroyWhatWentWell
    @Destroywell = WhatWentWell.find(params[:id])
    if @Destroywell.destroy
      redirect_to dashboards_path
    else
      render json: @idea.errors, status: :unprocessable_entity
    end
  end
  
  

  

 def createWhatWentWrong
  @wentwrong = WhatWentWrong.new(body: params[:body])  
  if @wentwrong.save
    redirect_to dashboards_path
  else
    render json: { errors: @wentwrong.errors.full_messages }, status: 500
  end
end



def updateWhatWentWrong
  @updatewell = WhatWentWell.find(params[:id])
  if @updatewell.update(body: params[:body])
    redirect_to dashboards_path
  else
    render json: { errors: @updatewell.errors.full_messages }, status: 500
  end
end



def destroyWhatWentWrong
  @Destroywrong = WhatWentWrong.find(params[:id])
  if @Destroywrong.destroy
    redirect_to dashboards_path
  else
    render json: @idea.errors, status: :unprocessable_entity
  end
end



def createImprovements
  @improve = Improvement.new(body: params[:body])  
  if @improve.save
    redirect_to dashboards_path
  else
    render json: { errors: @improve.errors.full_messages }, status: 500
  end
end



def updateImprovements
  @updatewell = WhatWentWell.find(params[:id])
  if @updatewell.update(body: params[:body])
    redirect_to dashboards_path
  else
    render json: { errors: @updatewell.errors.full_messages }, status: 500
  end
end



def destroyImprovements
  @Destroywell = Improvement.find(params[:id])
  if @Destroywell.destroy
    redirect_to dashboards_path
  else
    render json: @idea.errors, status: :unprocessable_entity
  end
end

end
