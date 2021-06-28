##
#Controller class for WhatWentWrong post
class WhatWentWrongsController < ApplicationController
  ##
  # Public: Creates a post for WhatWentWrong and displays it to the sprint page .
  # went_wrong - Holds reference to new WhatWentWrong post .
  # if post not created renders an error message .
  def create
    @went_wrong = WhatWentWrong.new(body: params[:body], sprint_id: params[:sprint_id])
    if @went_wrong.save
      redirect_to root_path + "/sprints/#{@went_wrong.sprint_id}"
    else
      render(json: {
               message: 'WhatWentWrong not created(length of body should be more than 5)'
             }) && return
    end
  end

  ##
  # Public: updates a post for WhatWentWrong and displays it to the sprint page .
  # update_wrong - Holds reference to the WhatWentWrong post with particular id.
  # if post not updated renders an error message
  def update
    if WhatWentWrong.exists?(id: params[:id])
      @update_wrong = WhatWentWrong.find(params[:id])
      @update_wrong.update(body: params[:body])
      redirect_to root_path + "/sprints/#{params[:sprint_id]}"
    else
      render(json: {
               message: 'Record with this id is not found'
             }) && return
    end
  end

  ##
  # Public: delete a post form WhatWentWrong and removes it from the the dashboard page .
  # destroy_wrong - Holds reference to the WhatWentWrong post with particular id.
  def destroy
    @destroy_wrong = WhatWentWrong.find(params[:id])
    @destroy_wrong.destroy
    redirect_to root_path + "/sprints/#{params[:sprint_id]}"
  end

  # Public: Increments likes value for WhatWentWrong post .
  # wrong - Holds reference to the WhatWentWrong post with particular id.
  def like
    @wrong = WhatWentWrong.find(params[:id])
    @wrong.update(likes: @wrong.likes + 1)
    redirect_to root_path + "/sprints/#{params[:sprint_id]}"
  end
end
