
class CompletedStoriesController < ApplicationController

    def create
      @completed_stories = CompletedStory.new(body: params[:body], sprint_id: params[:sprint_id])
      if @completed_stories.save
        redirect_to root_path + "/sprints/#{@completed_stories.sprint_id}"
      else
        render(json: {
                 message: 'completed_stories not created(length of body should be more than 5)'
               }) && return
      end
    end
  

    def update
      if CompletedStory.exists?(id: params[:id])
        @edit_completed_stories = CompletedStory.find(params[:id])
        @edit_completed_stories.update(body: params[:body])
        redirect_to root_path + "/sprints/#{params[:sprint_id]}"
      else
        render(json: {
                 message: 'Record with this id is not found'
               }) && return
      end
    end

    def destroy
      @destroy_completed_stories = CompletedStory.find(params[:id])
      @destroy_completed_stories.destroy
      redirect_to root_path + "/sprints/#{params[:sprint_id]}"
    end
  end
  
  