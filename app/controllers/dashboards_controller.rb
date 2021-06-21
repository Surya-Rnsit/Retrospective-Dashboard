class DashboardsController < ApplicationController

    skip_before_action :verify_authenticity_token

    #This method renders index.html.erb whih is the main dashboard page.
    def index
      @sprint=Sprint.find(params[:id])
      @well = @sprint.what_went_wells.all
      @wrong = @sprint.what_went_wrongs.all
      @improve = @sprint.improvements.all
      @action=@sprint.actionitems.all
      @allsprints=Sprint.all
    end

    def show
      @allsprints=Sprint.all
    end

    #Creates a post for whatwentwell and displays it to the dashboard page, otherwise renders an error message
    def createWhatWentWell
      @wentwell =WhatWentWell.new(body: params[:body],sprint_id:params[:sprint_id])  
      if @wentwell.save
        redirect_to 'http://localhost:3000/dashboards/'+ @wentwell.sprint_id.to_s
      else
          render(json: {
            message: 'createWhatWentWell not created(length of body should be more than 5)'
          }) && return
      end
    end
    
    #updates a post for whatwentwell and displays it to the dashboard page ,otherwise renders an error message
    def updateWhatWentWell
      if WhatWentWell.exists?(:id => params[:id])
        @editWell=WhatWentWell.find(params[:id])
        @editWell.update(body: params[:body])
        redirect_to 'http://localhost:3000/dashboards/'+ params[:sprint_id].to_s
      else  
        render(json: {
          message: 'Record with this id is not found'
        }) && return
      end
    end

    
    #Deletes a post for whatwentwell and removes it from the dashboard page
    def destroyWhatWentWell
      @destroywell = WhatWentWell.find(params[:id])
      @destroywell.destroy
      redirect_to 'http://localhost:3000/dashboards/'+ params[:sprint_id].to_s
    end
    
    
    #Creates a post for WhatWentWrong and displays it to the dashboard page, otherwise renders an error message
    def createWhatWentWrong
      @wentwrong = WhatWentWrong.new(body: params[:body],sprint_id:params[:sprint_id])  
      if @wentwrong.save
        redirect_to 'http://localhost:3000/dashboards/'+ @wentwrong.sprint_id.to_s
      else
        render(json: {
          message: 'createWhatWentWrong not created(length of body should be more than 5)'
        }) && return
      end
    end


    #updates a post for WhatWentWrong and displays it to the dashboard page otherwise renders an error message
    def updateWhatWentWrong
      if WhatWentWrong.exists?(:id => params[:id])
        @updatewrong=WhatWentWrong.find(params[:id])
        @updatewrong.update(body: params[:body])
        redirect_to 'http://localhost:3000/dashboards/'+ params[:sprint_id].to_s
      else  
        render(json: {
          message: 'Record with this id is not found'
        }) && return
      end
    end


    #Deletes a post for WhatWentWrong and removes it from the dashboard page
    def destroyWhatWentWrong
      @destroywrong = WhatWentWrong.find(params[:id])
      @destroywrong.destroy
      redirect_to 'http://localhost:3000/dashboards/'+ params[:sprint_id].to_s
    end


    #Creates a post for Improvement and displays it to the dashboard page otherwise renders an error message
    def createImprovements
      @improve = Improvement.new(body: params[:body],sprint_id:params[:sprint_id])  
      if @improve.save
        redirect_to 'http://localhost:3000/dashboards/'+ @improve.sprint_id.to_s
      else
        render(json: {
          message: 'Improvements not created(length of body should be more than 5)'
        }) && return
      end
    end


    #updates a post for Improvement and displays it to the dashboard page otherwise renders an error message
    def updateImprovements
      if Improvement.exists?(:id => params[:id])
        @updateImprovements=Improvement.find(params[:id])
        @updateImprovements.update(body: params[:body])
        redirect_to 'http://localhost:3000/dashboards/'+ params[:sprint_id].to_s
      else  
        render(json: {
          message: 'Record with this id is not found'
        }) && return
      end
    end


    #Deletes a post for Improvement and removes it from the dashboard page
    def destroyImprovements
      @destroywell = Improvement.find(params[:id])
      @destroywell.destroy
      redirect_to 'http://localhost:3000/dashboards/'+ params[:sprint_id].to_s
    end

    
    #Creates a post for Actionitem and displays it to the dashboard page otherwise renders an error message
    def createActionitems
      @Actionitem = Actionitem.new(body: params[:body],sprint_id:params[:sprint_id])  
      if @Actionitem.save
        redirect_to 'http://localhost:3000/dashboards/'+ @Actionitem.sprint_id.to_s
      else
        render(json: {
          message: 'createActionitems not created'
        }) && return
      end
    end

    #updates a post for Actionitem and displays it to the dashboard page otherwise renders an error message
    def updateActionitems
      if Actionitem.exists?(:id => params[:id])
        @actionitem=Actionitem.find(params[:id])
        @actionitem.update(body: params[:body])
        redirect_to 'http://localhost:3000/dashboards/'+ params[:sprint_id].to_s
      else  
        render(json: {
          message: 'Record with this id is not found'
        }) && return
      end
    end


    def updatecheckbox
      @actionitem=Actionitem.find(params[:id])
      if @actionitem.ischeck
        @actionitem.update(ischeck: false)        
      else
        @actionitem.update(ischeck: true)
      end
      redirect_to 'http://localhost:3000/dashboards/'+ params[:sprint_id].to_s
    end


    #Deletes a post for Actionitem and removes it from the dashboard page
    def destroyactionitems
      @actionitem = Actionitem.find(params[:id])
      @actionitem.destroy
      redirect_to 'http://localhost:3000/dashboards/'+ params[:sprint_id].to_s
    end


    def likeWhatWentWell
      @well = WhatWentWell.find(params[:id])
      @well.update_attributes(likes: @well.likes + 1)
      redirect_to 'http://localhost:3000/dashboards/'+ params[:sprint_id].to_s
    end


    def likeWhatWentWrong
      @wrong= WhatWentWrong.find(params[:id])
      @wrong.update_attributes(likes: @wrong.likes + 1)
      redirect_to 'http://localhost:3000/dashboards/'+ params[:sprint_id].to_s
    end


    def likeImprovements
      @improve= Improvement.find(params[:id])
      @improve.update_attributes(likes: @improve.likes + 1)
      redirect_to 'http://localhost:3000/dashboards/'+ params[:sprint_id].to_s
    end


    def createSprint
      @sprint = Sprint.new(name: params[:name])  
      @sprint.save
      redirect_to 'http://localhost:3000/dashboards/'+ @sprint.id.to_s
    end


    def destroySprint
      @sprint = Sprint.find(params[:id])
      @sprint.destroy
      redirect_to 'http://localhost:3000'
    end

end
