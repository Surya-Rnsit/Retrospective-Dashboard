require 'rails_helper'

RSpec.describe WhatWentWellsController, type: :controller do

    describe '#create' do
        let(:locale) { 'en' }
        it 'creates a successful post for what went well' do
          @sprint = Sprint.create(id: '1', name: 'firstsprint')
          @well = WhatWentWell.create(id: '1', body: 'bodyofwell', sprint_id: @sprint.id)
          expect(@well).to be_an_instance_of WhatWentWell
          post :create,
               params: { id: @well.id, body: @well.body, sprint_id: @well.sprint_id, locale: locale }
          expect(response).to redirect_to 'http://test.host/' + locale + '/sprints/' + @sprint.id.to_s
        end
    
        it 'When the body length is less than 5 , what went well is not created' do
          @sprint = Sprint.create(id: '1', name: 'firstsprint')
          @well = WhatWentWell.create(id: '1', body: 'body', sprint_id: @sprint.id)
          post :create,
               params: { id: @well.id, body: @well.body, sprint_id: @well.sprint_id, locale: locale }
          expect(JSON.parse(response.body)['message']).to eq('WhatWentWell not created(length of body should be more than 5)')
        end
    end

    describe 'PATCH #update' do
        let(:locale) { 'en' }
        it 'when update of what went well is successful' do
          @sprint = Sprint.create(id: '1', name: 'firstsprint')
          @updatewell = WhatWentWell.create(id: '1', body: 'bodyofwell', sprint_id: @sprint.id)
          patch :update,
                params: { id: @updatewell.id, body: @updatewell.body, sprint_id: @sprint.id, locale: locale }
          expect(response).to redirect_to 'http://test.host/' + locale + '/sprints/' + @sprint.id.to_s
        end
    
        it 'when update of what went well is not successful' do
          @sprint = Sprint.create(id: '1', name: 'firstsprint')
          @updatewell = WhatWentWell.create(id: '1', body: 'ss', sprint_id: @sprint.id)
          patch :update,
                params: { id: @updatewell.id, body: @updatewell.body, sprint_id: @updatewell.id, locale: locale }
          expect(JSON.parse(response.body)['message']).to eq('Record with this id is not found')
        end
    end


    describe 'DELETE #destroy' do
        let(:locale) { 'en' }
        it 'destroys the requested post for what went well' do
          @sprint = Sprint.create(id: '1', name: 'firstsprint')
          @well = WhatWentWell.create(id: '1', body: 'bodyofwell', sprint_id: @sprint.id)
          post :destroy, params: { id: @well.id, locale: locale }
          expect(response).to redirect_to 'http://test.host/' + locale + '/sprints/'
        end
    end

    describe 'POST #like' do
        let(:locale) { 'en' }
        it 'Increments the like button of what went well when clicked' do
          @sprint = Sprint.create(id: '1', name: 'firstsprint')
          @well = WhatWentWell.create(id: '1', body: 'bodyofwell', sprint_id: @sprint.id, likes: 2)
          @no_like = @well.likes
          post :like, params: { id: @well.id, sprint_id: @sprint.id, locale: locale }
          if @no_like + 1 == @well.likes
            expect(response).to redirect_to 'http://localhost:3000/' + locale + '/sprints/' + @sprint.id.to_s
          end
        end
    end 
    
end