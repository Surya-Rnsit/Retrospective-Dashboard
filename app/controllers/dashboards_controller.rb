class DashboardsController < ApplicationController

    skip_before_action :verify_authenticity_token

    # Public: This method renders index.html.erb which is the main dashboard page.
    # sprint - Holds reference to the current sprint
    # well - Holds reference to all the Whatwentwell posts of current sprint
    # wrong - Holds reference to all the WhatWentWrong posts of current sprint
    # improve - Holds reference to all the Improvement posts of current sprint
    # action - Holds reference to all the actionitems posts of current sprint
    # allsprints - Holds reference to all available sprints
    def index
      @sprint=Sprint.find(params[:id])
      @well = @sprint.what_went_wells.all
      @wrong = @sprint.what_went_wrongs.all
      @improve = @sprint.improvements.all
      @action=@sprint.actionitems.all
      @allsprints=Sprint.all
    end

    # Public: This method renders show.html.erb which is the root page.
    # allsprints - Holds reference to all available sprints
    def show
      @allsprints=Sprint.all
    end

    # Public: Creates a post for whatwentwell and displays it to the dashboard page
    # wentwell - Holds reference to new whatwentwell post
    # if post not created renders an error message
    def createWhatWentWell
      @wentwell =WhatWentWell.new(body: params[:body],sprint_id:params[:sprint_id])  
      if @wentwell.save
        redirect_to 'http://localhost:3000/'+params[:locale]+'/dashboards/'+ @wentwell.sprint_id.to_s
      else
          render(json: {
            message: 'createWhatWentWell not created(length of body should be more than 5)'
          }) && return
      end
    end
    
    # Public: updates a post for whatwentwell and displays it to the dashboard page
    # editWell - Holds reference to the whatwentwell post with particular id.
    # if post not updated renders an error message
    def updateWhatWentWell
      if WhatWentWell.exists?(:id => params[:id])
        @editWell=WhatWentWell.find(params[:id])
        @editWell.update(body: params[:body])
        redirect_to 'http://localhost:3000/'+params[:locale]+'/dashboards/'+ params[:sprint_id].to_s
      else  
        render(json: {
          message: 'Record with this id is not found'
        }) && return
      end
    end

    
    # Public: delete a post form whatwentwell and removes it from the the dashboard page
    # destroywell - Holds reference to the whatwentwell post with particular id.
    def destroyWhatWentWell
      @destroywell = WhatWentWell.find(params[:id])
      @destroywell.destroy
      redirect_to 'http://localhost:3000/'+params[:locale]+'/dashboards/'+ params[:sprint_id].to_s
    end
    
    
    # Public: Creates a post for WhatWentWrong and displays it to the dashboard page
    # wentwrong - Holds reference to new WhatWentWrong post
    # if post not created renders an error message
    def createWhatWentWrong
      @wentwrong = WhatWentWrong.new(body: params[:body],sprint_id:params[:sprint_id])  
      if @wentwrong.save
        redirect_to 'http://localhost:3000/'+params[:locale]+'/dashboards/'+ @wentwrong.sprint_id.to_s
      else
        render(json: {
          message: 'createWhatWentWrong not created(length of body should be more than 5)'
        }) && return
      end
    end


    # Public: updates a post for WhatWentWrong and displays it to the dashboard page
    # updatewrong - Holds reference to the WhatWentWrong post with particular id.
    # if post not updated renders an error message
    def updateWhatWentWrong
      if WhatWentWrong.exists?(:id => params[:id])
        @updatewrong=WhatWentWrong.find(params[:id])
        @updatewrong.update(body: params[:body])
        redirect_to 'http://localhost:3000/'+params[:locale]+'/dashboards/'+ params[:sprint_id].to_s
      else  
        render(json: {
          message: 'Record with this id is not found'
        }) && return
      end
    end


    # Public: delete a post form WhatWentWrong and removes it from the the dashboard page
    # destroywrong - Holds reference to the WhatWentWrong post with particular id.
    def destroyWhatWentWrong
      @destroywrong = WhatWentWrong.find(params[:id])
      @destroywrong.destroy
      redirect_to 'http://localhost:3000/'+params[:locale]+'/dashboards/'+ params[:sprint_id].to_s
    end


    # Public: Creates a post for Improvement and displays it to the dashboard page
    # improve - Holds reference to new Improvement post
    # if post not created renders an error message
    def createImprovements
      @improve = Improvement.new(body: params[:body],sprint_id:params[:sprint_id])  
      if @improve.save
        redirect_to 'http://localhost:3000/'+params[:locale]+'/dashboards/'+ @improve.sprint_id.to_s
      else
        render(json: {
          message: 'Improvements not created(length of body should be more than 5)'
        }) && return
      end
    end


    # Public: updates a post for Improvement and displays it to the dashboard page
    # updateImprovements - Holds reference to the Improvement post with particular id.
    # if post not updated renders an error message
    def updateImprovements
      if Improvement.exists?(:id => params[:id])
        @updateImprovements=Improvement.find(params[:id])
        @updateImprovements.update(body: params[:body])
        redirect_to 'http://localhost:3000/'+params[:locale]+'/dashboards/'+ params[:sprint_id].to_s
      else  
        render(json: {
          message: 'Record with this id is not found'
        }) && return
      end
    end


    # Public: delete a post form Improvement and removes it from the the dashboard page
    # destroywell - Holds reference to the Improvement post with particular id.
    def destroyImprovements
      @destroywell = Improvement.find(params[:id])
      @destroywell.destroy
      redirect_to 'http://localhost:3000/'+params[:locale]+'/dashboards/'+ params[:sprint_id].to_s
    end

    
    # Public: Creates a post for Actionitem and displays it to the dashboard page
    # Actionitem - Holds reference to new Actionitem 
    # if post not created renders an error message
    def createActionitems
      @Actionitem = Actionitem.new(body: params[:body],sprint_id:params[:sprint_id])  
      if @Actionitem.save
        redirect_to 'http://localhost:3000/'+params[:locale]+'/dashboards/'+ @Actionitem.sprint_id.to_s
      else
        render(json: {
          message: 'createActionitems not created'
        }) && return
      end
    end

    # Public: updates a post for Actionitem and displays it to the dashboard page
    # actionitem - Holds reference to the Actionitem post with particular id.
    # if post not updated renders an error message
    def updateActionitems
      if Actionitem.exists?(:id => params[:id])
        @actionitem=Actionitem.find(params[:id])
        @actionitem.update(body: params[:body])
        redirect_to 'http://localhost:3000/'+params[:locale]+'/dashboards/'+ params[:sprint_id].to_s
      else  
        render(json: {
          message: 'Record with this id is not found'
        }) && return
      end
    end

    # Public: updates the state of the checkbox of action list
    # actionitem - Holds reference to the Actionitem post with particular id.
    def updatecheckbox
      @actionitem=Actionitem.find(params[:id])
      if @actionitem.ischeck
        @actionitem.update(ischeck: false)        
      else
        @actionitem.update(ischeck: true)
      end
      redirect_to 'http://localhost:3000/'+params[:locale]+'/dashboards/'+ params[:sprint_id].to_s
    end


    # Public: delete a post form Actionitem and removes it from the the dashboard page
    # actionitem - Holds reference to the Actionitem post with particular id.
    def destroyactionitems
      @actionitem = Actionitem.find(params[:id])
      @actionitem.destroy
      redirect_to 'http://localhost:3000/'+params[:locale]+'/dashboards/'+ params[:sprint_id].to_s
    end

    # Public: Increments likes value for whatwentwell post
    # well - Holds reference to the WhatWentWell post with particular id.
    def likeWhatWentWell
      @well = WhatWentWell.find(params[:id])
      @well.update_attributes(likes: @well.likes + 1)
      redirect_to 'http://localhost:3000/'+params[:locale]+'/dashboards/'+params[:sprint_id].to_s
    end

    # Public: Increments likes value for WhatWentWrong post
    # wrong - Holds reference to the WhatWentWrong post with particular id.
    def likeWhatWentWrong
      @wrong = WhatWentWrong.find(params[:id])
      @wrong.update_attributes(likes: @wrong.likes + 1)
      redirect_to 'http://localhost:3000/'+params[:locale]+'/dashboards/'+ params[:sprint_id].to_s
    end

    # Public: Increments likes value for Improvement post
    # improve - Holds reference to the Improvement post with particular id.
    def likeImprovements
      @improve= Improvement.find(params[:id])
      @improve.update_attributes(likes: @improve.likes + 1)
      redirect_to 'http://localhost:3000/'+params[:locale]+'/dashboards/'+ params[:sprint_id].to_s
    end

    # Public: creates new sprint
    # sprint - Holds reference to the new sprint.
    def createSprint
      @sprint = Sprint.new(name: params[:name])  
      if @sprint.save
         redirect_to 'http://localhost:3000/dashboards/'+ @sprint.id.to_s
      else
         render(json: {
          message: 'Sprint Already Exists or Sprint not created'
        }) && return
      end
    end
    
    
    # Public: destroy a sprint with particular id 
    # sprint - Holds reference to the sprint to be destroyed.
    def destroySprint
      @sprint = Sprint.find(params[:id])
      @sprint.destroy
      redirect_to 'http://localhost:3000'
    end

    # Public: Moves action items from source sprint to the destination sprint 
    # currentSprint - Holds reference to the current sprint.
    # destinationSprint - Holds reference to the destination sprint.
    # actionToMove - Holds reference to the action item which is to be moved.
    # newItem - Creates a new action item similar to actionToMove.
    def moveActionItems
      @currentSprint=Sprint.find(params[:sprint_id])
      @destinationSprint=Sprint.find(params[:moveto])
      @actionToMove=@currentSprint.actionitems.find(params[:action_id])

      @newItem = Actionitem.new(body: @actionToMove.body ,sprint_id: @destinationSprint.id)  
      @newItem.save

      @actionToMove.destroy
      redirect_to 'http://localhost:3000/'+params[:locale]+'/dashboards/'+ params[:sprint_id].to_s
    end

end
