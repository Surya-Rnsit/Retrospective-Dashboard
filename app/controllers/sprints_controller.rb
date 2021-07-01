##
# Controller class for Sprint.
class SprintsController < ApplicationController
  ##
  # Public: This method renders index.html.erb which is the root page .
  # all_sprints - Holds reference to all available sprints .
  def index
    @all_sprints = Sprint.all
  end

  ##
  # Public: This method renders show.html.erb which is the main dashboard page.
  # sprint - Holds reference to the current sprint .
  # what_went_well - Holds reference to all the Whatwentwell posts of current sprint .
  # what_went_wrong - Holds reference to all the WhatWentWrong posts of current sprint .
  # improvements - Holds reference to all the Improvement posts of current sprint .
  # action_items - Holds reference to all the actionitems posts of current sprint .
  # all_sprints - Holds reference to all available sprints .
  def show
    @sprint = Sprint.find(params[:id])
    @all_sprints = Sprint.all
    @what_went_well = Sprint.includes(:what_went_wells).where(what_went_wells: { sprint_id: @sprint.id})
    @action_items = Sprint.includes(:actionitems).where(actionitems: { sprint_id: @sprint.id })
    @what_went_wrong = Sprint.includes(:what_went_wrongs).where(what_went_wrongs: { sprint_id: @sprint.id })
    @improvements = Sprint.includes(:improvements).where(improvements: { sprint_id: @sprint.id })
  end

  ##
  # Public: creates new sprint
  # sprint - Holds reference to the new sprint.
  def create
    @sprint = Sprint.new(name: params[:name])
    if @sprint.save
      redirect_to root_path + "/sprints/#{@sprint.id}"
    else
      redirect_to root_path, danger: t('Sprint Already Exists')       
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


