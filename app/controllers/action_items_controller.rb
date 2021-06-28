##
# Controller class for Actionitem post
class ActionItemsController < ApplicationController
  # Public: Creates a post for Actionitem and displays it to the sprints page
  # action_item - Holds reference to new Actionitem
  # if post not created renders an error message
  def create
    @action_item = Actionitem.new(body: params[:body], sprint_id: params[:sprint_id])
    if @action_item.save
      redirect_to root_path + "/sprints/#{@action_item.sprint_id}"
    else
      render(json: {
               message: 'Actionitems not created'
             }) && return
    end
  end

  ##
  # Public: updates a post for Actionitem and displays it to the sprints page
  # action_item - Holds reference to the Actionitem post with particular id.
  # if post not updated renders an error message
  def update
    if Actionitem.exists?(id: params[:id])
      @action_item = Actionitem.find(params[:id])
      @action_item.update(body: params[:body])
      redirect_to root_path + "/sprints/#{params[:sprint_id]}"
    else
      render(json: {
               message: 'Record with this id is not found'
             }) && return
    end
  end

  ##
  # Public: updates the state of the checkbox of action list
  # action_item - Holds reference to the Actionitem post with particular id.
  def update_checkbox
    @action_item = Actionitem.find(params[:id])
    if @action_item.ischeck
      @action_item.update(ischeck: false)
    else
      @action_item.update(ischeck: true)
    end
    redirect_to root_path + "/sprints/#{params[:sprint_id]}"
  end

  ##
  # Public: delete a post form Actionitem and removes it from the the sprints page
  # action_item - Holds reference to the Actionitem post with particular id.
  def destroy
    @action_item = Actionitem.find(params[:id])
    @action_item.destroy
    redirect_to root_path + "/sprints/#{params[:sprint_id]}"
  end

  ##
  # Public: Moves action items from source sprint to the destination sprint
  # current_sprint - Holds reference to the current sprint.
  # destination_sprint - Holds reference to the destination sprint.
  # action_to_move - Holds reference to the action item which is to be moved.
  # new_item - Creates a new action item similar to actionToMove.
  def move
    @current_sprint = Sprint.find(params[:sprint_id])
    @destination_sprint = Sprint.find(params[:moveto])
    @action_to_move = @current_sprint.actionitems.find(params[:action_id])

    @new_item = Actionitem.new(body: @action_to_move.body, sprint_id: @destination_sprint.id)
    @new_item.save

    @action_to_move.destroy
    redirect_to root_path + "/sprints/#{params[:sprint_id]}"
  end
end
