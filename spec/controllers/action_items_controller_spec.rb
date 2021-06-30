require 'rails_helper'

RSpec.describe ActionItemsController, type: :controller do

    describe '#create' do
        let(:locale) { 'en' }
        let(:sprint) do
          Sprint.create(
            id: '1', 
            name: 'firstsprint'
          )
        end
        it 'creates a successful post for Actionitems' do
          @action = Actionitem.create(id: '1', body: 'bodyaction', sprint_id: sprint.id)
          expect(@action).to be_an_instance_of Actionitem
          post :create,
               params: { id: @action.id, body: @action.body, sprint_id: @action.sprint_id, locale: locale }
          expect(response).to redirect_to 'http://test.host/' + locale + '/sprints/' + sprint.id.to_s
        end
        it 'When the body length is less than 5 , Actionitems is not created' do
          @action = Improvement.create(id: '1', body: 'body', sprint_id: sprint.id)
          post :create,
               params: { id: @action.id, body: @action.body, sprint_id: @action.sprint_id, locale: locale }
          expect(JSON.parse(response.body)['message']).to eq('Actionitems not created')
        end
    end
    
    describe 'PATCH #update' do
        let(:locale) { 'en' }
        let(:sprint) do
          Sprint.create(
            id: '1', 
            name: 'firstsprint'
          )
        end
        it 'when update of action is successful' do
          @update = Actionitem.create(id: '1', body: 'bodyofaction', sprint_id: sprint.id)
          patch :update,
                params: { id: @update.id, body: @update.body, sprint_id: sprint.id, locale: locale }
          expect(response).to redirect_to 'http://test.host/' + locale + '/sprints/' + sprint.id.to_s
        end
    
        it 'when update of what went wrong is not successful' do
          @update = Actionitem.create(id: '1', body: 'ss')
          patch :update,
                params: { id: @update.id, body: @update.body, sprint_id: sprint.id, locale: locale }
          expect(JSON.parse(response.body)['message']).to eq('Record with this id is not found')
        end
    end


    describe 'DELETE #destroy' do
        let(:locale) { 'en' }
        it 'destroys the requested post for actionitems' do
          @sprint = Sprint.create(id: '1', name: 'firstsprint')
          @action = Actionitem.create(id: '1', body: 'bodyofwell', sprint_id: @sprint.id)
          post :destroy, params: { id: @action.id, locale: locale }
          expect(response).to redirect_to 'http://test.host/' + locale + '/sprints/'
        end
    end
      
      
    describe 'POST #update_checkbox' do
        let(:locale) { 'en' }
        let(:sprint) do
          Sprint.create(
            id: '1', 
            name: 'firstsprint'
          )
        end
        it 'update checkbox when ischeck is true' do
          @action = Actionitem.create(id: '1', body: 'bodyofwell', sprint_id: sprint.id, ischeck: 'true')
          post :update_checkbox, params: { id: @action.id, sprint_id: sprint.id, locale: locale }
          if @action.ischeck == true
            @action.update(ischeck: false)
            redirect_to 'http://localhost:3000/' + locale + '/sprints/' + sprint.id.to_s
          end
        end
    
        it 'update checkbox when ischeck is false' do
          @action = Actionitem.create(id: '1', body: 'bodyofwell', sprint_id: sprint.id, ischeck: 'false')
          post :update_checkbox, params: { id: @action.id, sprint_id: sprint.id, locale: locale }
          @action.update(ischeck: true)
          if @action.ischeck == false
            @action.update(ischeck: true)
            redirect_to 'http://localhost:3000/' + locale + '/sprints/' + sprint.id.to_s
          end
        end
    end
      
    describe 'POST #move' do
        let(:locale) { 'en' }
        it 'When moving unchecked action items to a selected sprint' do
          @current = Sprint.create(id: '1', name: 'current')
          @action = Actionitem.create(id: '1', body: 'bodyofwell', sprint_id: @current.id, ischeck: 'false')
          @destination = Sprint.create(id: '2', name: 'destination')
          post :move, params: { action_id: @action.id, sprint_id: @current.id, moveto: @destination.id, locale: locale }
          @newaction = Actionitem.create(id: @action.id, body: @action.body, sprint_id: @destination.id,
                                         ischeck: 'false')
          @action.destroy
          redirect_to 'http://localhost:3000/' + locale + '/sprints/' + @current.id.to_s
        end
    end 
    
end
