##
# Controller class for Sprint.
class SprintsController < ApplicationController
  ##
  # Public: This method renders index.html.erb which is the root page .
  # allsprints - Holds reference to all available sprints .
  def index
    @allsprints = Sprint.all
  end

  ##
  # Public: This method renders show.html.erb which is the main dashboard page.
  # sprint - Holds reference to the current sprint .
  # well - Holds reference to all the Whatwentwell posts of current sprint .
  # wrong - Holds reference to all the WhatWentWrong posts of current sprint .
  # improve - Holds reference to all the Improvement posts of current sprint .
  # action - Holds reference to all the actionitems posts of current sprint .
  # allsprints - Holds reference to all available sprints .
  def show
    @sprint = Sprint.find(params[:id])
    @allsprints = Sprint.all
    @well = Sprint.includes(:what_went_wells).where(what_went_wells: { sprint_id: @sprint.id.to_s })
    @action = Sprint.includes(:actionitems).where(actionitems: { sprint_id: @sprint.id.to_s })
    @wrong = Sprint.includes(:what_went_wrongs).where(what_went_wrongs: { sprint_id: @sprint.id.to_s })
    @improve = Sprint.includes(:improvements).where(improvements: { sprint_id: @sprint.id.to_s })
  end

  ##
  # Public: creates new sprint
  # sprint - Holds reference to the new sprint.
  def create
    @sprint = Sprint.new(name: params[:name])
    if @sprint.save
      redirect_to root_path + "/sprints/#{@sprint.id}"
    else
      render(json: {
               message: 'Sprint Already Exists or Sprint not created'
             }) && return
    end
  end

  ##
  # Public: destroy a sprint with particular id
  # sprint - Holds reference to the sprint to be destroyed.
  def destroy
    @sprint = Sprint.find(params[:id])
    @sprint.destroy
    redirect_to root_path
  end
end
