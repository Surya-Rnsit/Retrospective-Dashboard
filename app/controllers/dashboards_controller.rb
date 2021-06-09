class DashboardsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @well = WhatWentWell.all
    @wrong = WhatWentWrong.all
    @improve = Improvement.all
    @action=Actionitem.all
  end


  def createWhatWentWell
    @wentwell = WhatWentWell.new(body: params[:body])  
    if @wentwell.save
      redirect_to dashboards_path
    else
      render json: { errors: @wentwell.errors.full_messages }, status: 500
    end
  end
  


  def updateWhatWentWell
    @editWell = WhatWentWell.find(params[:id])
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
  @updatewrong = WhatWentWrong.find(params[:id])
  if @updatewrong.update(body: params[:body])
    redirect_to dashboards_path
  else
    render json: { errors: @updatewrong.errors.full_messages }, status: 500
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
  @updateImprovements = Improvement.find(params[:id])
  if @updateImprovements.update(body: params[:body])
    redirect_to dashboards_path
  else
    render json: { errors: @updateImprovements.errors.full_messages }, status: 500
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


def createActionitems
  @Actionitem = Actionitem.new(body: params[:body])  
  if @Actionitem.save
    redirect_to dashboards_path
  else
    render json: { errors: @Actionitem.errors.full_messages }, status: 500
  end
end


def updateActionitems
  @Actionitem = Actionitem.find(params[:id])
  if @Actionitem.update(body: params[:body])
    redirect_to dashboards_path
  else
    render json: { errors: @Actionitem.errors.full_messages }, status: 500
  end
end

def destroyactionitems
  @Actionitem = Actionitem.find(params[:id])
  if @Actionitem.destroy
    redirect_to dashboards_path
  else
    render json: @idea.errors, status: :unprocessable_entity
  end
end


end
