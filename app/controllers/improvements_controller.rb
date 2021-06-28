# frozen_string_literal: true

##
# Controller class for Improvement
class ImprovementsController < ApplicationController
  ##
  # Public: Creates a post for Improvement and displays it to the sprints page
  # improve - Holds reference to new Improvement post
  # if post not created renders an error message
  def create
    @improve = Improvement.new(body: params[:body], sprint_id: params[:sprint_id])
    if @improve.save
      redirect_to root_path + "/sprints/#{@improve.sprint_id}"
    else
      render(json: {
               message: 'Improvements not created(length of body should be more than 5)'
             }) && return
    end
  end

  ##
  # Public: updates a post for Improvement and displays it to the sprints page
  # improvements - Holds reference to the Improvement post with particular id.
  # if post not updated renders an error message
  def update
    if Improvement.exists?(id: params[:id])
      @improvements = Improvement.find(params[:id])
      @improvements.update(body: params[:body])
      redirect_to root_path + "/sprints/#{params[:sprint_id]}"
    else
      render(json: {
               message: 'Record with this id is not found'
             }) && return
    end
  end

  ##
  # Public: delete a post form Improvement and removes it from the the sprints page
  # destroy_well - Holds reference to the Improvement post with particular id.
  def destroy
    @destroy_well = Improvement.find(params[:id])
    @destroy_well.destroy
    redirect_to root_path + "/sprints/#{params[:sprint_id]}"
  end

  ##
  # Public: Increments likes value for Improvement post
  # improve - Holds reference to the Improvement post with particular id.
  def like
    @improve = Improvement.find(params[:id])
    @improve.update(likes: @improve.likes + 1)
    redirect_to root_path + "/sprints/#{params[:sprint_id]}"
  end
end
