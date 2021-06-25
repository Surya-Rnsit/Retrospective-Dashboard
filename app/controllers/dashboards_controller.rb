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
    @sprint = Sprint.find(params[:id])
    @well = Sprint.includes(:what_went_wells).where(what_went_wells: {sprint_id: "#{@sprint.id}"})
    @wrong = Sprint.includes(:what_went_wrongs).where(what_went_wrongs: {sprint_id: "#{@sprint.id}"})
    @improve = Sprint.includes(:improvements).where(improvements: {sprint_id: "#{@sprint.id}"})
    @action = Sprint.includes(:actionitems).where(actionitems: {sprint_id: "#{@sprint.id}"})
    #@well = @sprint.what_went_wells.all
    #@wrong = @sprint.what_went_wrongs.all
    #@improve = @sprint.improvements.all
    #@action = @sprint.actionitems.all
    @allsprints = Sprint.all

    
  end

  # Public: This method renders show.html.erb which is the root page.
  # allsprints - Holds reference to all available sprints
  def show
    @allsprints = Sprint.all
  end

  # Public: Creates a post for whatwentwell and displays it to the dashboard page
  # went_well - Holds reference to new whatwentwell post
  # if post not created renders an error message
  def create_whatwentwell
    @went_well = WhatWentWell.new(body: params[:body], sprint_id: params[:sprint_id])
    if @went_well.save
      redirect_to root_path+"/dashboards/#{@went_well.sprint_id}"
    else
      render(json: {
               message: 'createWhatWentWell not created(length of body should be more than 5)'
             }) && return
    end
  end

  # Public: updates a post for whatwentwell and displays it to the dashboard page
  # edit_well - Holds reference to the whatwentwell post with particular id.
  # if post not updated renders an error message
  def update_whatwentwell
    if WhatWentWell.exists?(id: params[:id])
      @edit_well = WhatWentWell.find(params[:id])
      @edit_well.update(body: params[:body])
      redirect_to root_path+"/dashboards/#{params[:sprint_id]}"
    else
      render(json: {
               message: 'Record with this id is not found'
             }) && return
    end
  end

  # Public: delete a post form whatwentwell and removes it from the the dashboard page
  # destroy_well - Holds reference to the whatwentwell post with particular id.
  def destroy_whatwentwell
    @destroy_well = WhatWentWell.find(params[:id])
    @destroy_well.destroy
    redirect_to root_path+"/dashboards/#{params[:sprint_id]}"
  end

  # Public: Creates a post for WhatWentWrong and displays it to the dashboard page
  # went_wrong - Holds reference to new WhatWentWrong post
  # if post not created renders an error message
  def create_whatwentwrong
    @went_wrong = WhatWentWrong.new(body: params[:body], sprint_id: params[:sprint_id])
    if @went_wrong.save
      redirect_to root_path+"/dashboards/#{@went_wrong.sprint_id}"
    else
      render(json: {
               message: 'createWhatWentWrong not created(length of body should be more than 5)'
             }) && return
    end
  end

  # Public: updates a post for WhatWentWrong and displays it to the dashboard page
  # update_wrong - Holds reference to the WhatWentWrong post with particular id.
  # if post not updated renders an error message
  def update_whatwentwrong
    if WhatWentWrong.exists?(id: params[:id])
      @update_wrong = WhatWentWrong.find(params[:id])
      @update_wrong.update(body: params[:body])
      redirect_to root_path+"/dashboards/#{params[:sprint_id]}"
    else
      render(json: {
               message: 'Record with this id is not found'
             }) && return
    end
  end

  # Public: delete a post form WhatWentWrong and removes it from the the dashboard page
  # destroy_wrong - Holds reference to the WhatWentWrong post with particular id.
  def destroy_whatwentwrong
    @destroy_wrong = WhatWentWrong.find(params[:id])
    @destroy_wrong.destroy
    redirect_to root_path+"/dashboards/#{params[:sprint_id]}"
  end

  # Public: Creates a post for Improvement and displays it to the dashboard page
  # improve - Holds reference to new Improvement post
  # if post not created renders an error message
  def create_improvements
    @improve = Improvement.new(body: params[:body], sprint_id: params[:sprint_id])
    if @improve.save
      redirect_to root_path+"/dashboards/#{@improve.sprint_id}"
    else
      render(json: {
               message: 'Improvements not created(length of body should be more than 5)'
             }) && return
    end
  end

  # Public: updates a post for Improvement and displays it to the dashboard page
  # improvements - Holds reference to the Improvement post with particular id.
  # if post not updated renders an error message
  def update_improvements
    if Improvement.exists?(id: params[:id])
      @improvements = Improvement.find(params[:id])
      @improvements.update(body: params[:body])
      redirect_to root_path+"/dashboards/#{params[:sprint_id]}"
    else
      render(json: {
               message: 'Record with this id is not found'
             }) && return
    end
  end

  # Public: delete a post form Improvement and removes it from the the dashboard page
  # destroy_well - Holds reference to the Improvement post with particular id.
  def destroy_improvements
    @destroy_well = Improvement.find(params[:id])
    @destroy_well.destroy
    redirect_to root_path+"/dashboards/#{params[:sprint_id]}"
  end

  # Public: Creates a post for Actionitem and displays it to the dashboard page
  # action_item - Holds reference to new Actionitem
  # if post not created renders an error message
  def create_actionitems
    @action_item = Actionitem.new(body: params[:body], sprint_id: params[:sprint_id])
    if @action_item.save
      redirect_to root_path+"/dashboards/#{@action_item.sprint_id}"
    else
      render(json: {
               message: 'createActionitems not created'
             }) && return
    end
  end

  # Public: updates a post for Actionitem and displays it to the dashboard page
  # action_item - Holds reference to the Actionitem post with particular id.
  # if post not updated renders an error message
  def update_actionitems
    if Actionitem.exists?(id: params[:id])
      @action_item = Actionitem.find(params[:id])
      @action_item.update(body: params[:body])
      redirect_to root_path+"/dashboards/#{params[:sprint_id]}"
    else
      render(json: {
               message: 'Record with this id is not found'
             }) && return
    end
  end

  # Public: updates the state of the checkbox of action list
  # action_item - Holds reference to the Actionitem post with particular id.
  def update_checkbox
    @action_item = Actionitem.find(params[:id])
    if @action_item.ischeck
      @action_item.update(ischeck: false)
    else
      @action_item.update(ischeck: true)
    end
    redirect_to root_path+"/dashboards/#{params[:sprint_id]}"
  end

  # Public: delete a post form Actionitem and removes it from the the dashboard page
  # action_item - Holds reference to the Actionitem post with particular id.
  def destroy_actionitems
    @action_item = Actionitem.find(params[:id])
    @action_item.destroy
    redirect_to root_path+"/dashboards/#{params[:sprint_id]}"
  end

  # Public: Increments likes value for whatwentwell post
  # well - Holds reference to the WhatWentWell post with particular id.
  def like_whatwentwell
    @well = WhatWentWell.find(params[:id])
    @well.update(likes: @well.likes + 1)
    redirect_to root_path+"/dashboards/#{params[:sprint_id]}"
  end

  # Public: Increments likes value for WhatWentWrong post
  # wrong - Holds reference to the WhatWentWrong post with particular id.
  def like_whatwentwrong
    @wrong = WhatWentWrong.find(params[:id])
    @wrong.update(likes: @wrong.likes + 1)
    redirect_to root_path+"/dashboards/#{params[:sprint_id]}"
  end

  # Public: Increments likes value for Improvement post
  # improve - Holds reference to the Improvement post with particular id.
  def like_improvements
    @improve = Improvement.find(params[:id])
    @improve.update(likes: @improve.likes + 1)
    redirect_to root_path+"/dashboards/#{params[:sprint_id]}"
  end

  # Public: creates new sprint
  # sprint - Holds reference to the new sprint.
  def create_sprint
    @sprint = Sprint.new(name: params[:name])
    if @sprint.save
      redirect_to root_path+"/dashboards/#{@sprint.id}"
    else
      render(json: {
               message: 'Sprint Already Exists or Sprint not created'
             }) && return
    end
  end

  # Public: destroy a sprint with particular id
  # sprint - Holds reference to the sprint to be destroyed.
  def destroy_sprint
    @sprint = Sprint.find(params[:id])
    @sprint.destroy
    redirect_to root_path
  end

  # Public: Moves action items from source sprint to the destination sprint
  # current_sprint - Holds reference to the current sprint.
  # destination_sprint - Holds reference to the destination sprint.
  # action_to_move - Holds reference to the action item which is to be moved.
  # new_item - Creates a new action item similar to actionToMove.
  def move_actionitems
    @current_sprint = Sprint.find(params[:sprint_id])
    @destination_sprint = Sprint.find(params[:moveto])
    @action_to_move = @current_sprint.actionitems.find(params[:action_id])

    @new_item = Actionitem.new(body: @action_to_move.body, sprint_id: @destination_sprint.id)
    @new_item.save

    @action_to_move.destroy
    redirect_to root_path+"/dashboards/#{params[:sprint_id]}"
  end
end
