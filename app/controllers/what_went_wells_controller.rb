##
# Controller class for WhatWentWell post
class WhatWentWellsController < ApplicationController
  ##
  # Public: Creates a post for whatwentwell and displays it to the sprints page .
  # went_well - Holds reference to new whatwentwell post with particular id.
  # if post not created renders an error message
  def create
    @went_well = WhatWentWell.new(body: params[:body], sprint_id: params[:sprint_id])
    if @went_well.save
      redirect_to root_path + "/sprints/#{@went_well.sprint_id}"
    else
      render(json: {
               message: 'WhatWentWell not created(length of body should be more than 5)'
             }) && return
    end
  end

  ##
  # Public: updates a post for whatwentwell and displays it to the sprints page .
  # edit_well - Holds reference to the whatwentwell post with particular id.
  # if post not updated renders an error message
  def update
    if WhatWentWell.exists?(id: params[:id])
      @edit_well = WhatWentWell.find(params[:id])
      @edit_well.update(body: params[:body])
      redirect_to root_path + "/sprints/#{params[:sprint_id]}"
    else
      render(json: {
               message: 'Record with this id is not found'
             }) && return
    end
  end

  ##
  # Public: delete a post form whatwentwell and removes it from the the sprints page .
  # destroy_well - Holds reference to the whatwentwell post with particular id.
  def destroy
    @destroy_well = WhatWentWell.find(params[:id])
    @destroy_well.destroy
    redirect_to root_path + "/sprints/#{params[:sprint_id]}"
  end

  ##
  # Public: Increments likes value for whatwentwell post
  # well - Holds reference to the WhatWentWell post with particular id.
  def like
    @well = WhatWentWell.find(params[:id])
    @well.update(likes: @well.likes + 1)
    redirect_to root_path + "/sprints/#{params[:sprint_id]}"
  end
end
