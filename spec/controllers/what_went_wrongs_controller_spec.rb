require 'rails_helper'

RSpec.describe WhatWentWrongsController, type: :controller do
    
    describe '#create' do
        let(:locale) { 'en' }
        it 'creates a successful post for what went wrong' do
          @sprint = Sprint.create(id: '1', name: 'firstsprint')
          @wrong = WhatWentWrong.create(id: '1', body: 'bodywrong', sprint_id: @sprint.id)
          expect(@wrong).to be_an_instance_of WhatWentWrong
          post :create,
               params: { id: @wrong.id, body: @wrong.body, sprint_id: @wrong.sprint_id, locale: locale }
          expect(response).to redirect_to 'http://test.host/' + locale + '/sprints/' + @sprint.id.to_s
        end
    
        it 'When the body length is less than 5 , what went wrong is not created' do
          @sprint = Sprint.create(id: '1', name: 'firstsprint')
          @wrong = WhatWentWrong.create(id: '1', body: 'body', sprint_id: @sprint.id)
          post :create,
               params: { id: @wrong.id, body: @wrong.body, sprint_id: @wrong.sprint_id, locale: locale }
          expect(JSON.parse(response.body)['message']).to eq('WhatWentWrong not created(length of body should be more than 5)')
        end
      end

    describe 'PATCH #update' do
        let(:locale) { 'en' }
        it 'when update of what went wrong is successful' do
          @sprint = Sprint.create(id: '1', name: 'firstsprint')
          @updatewrong = WhatWentWrong.create(id: '1', body: 'bodyofwrong', sprint_id: @sprint.id)
          patch :update,
                params: { id: @updatewrong.id, body: @updatewrong.body, sprint_id: @sprint.id, locale: locale }
          expect(response).to redirect_to 'http://test.host/' + locale + '/sprints/' + @sprint.id.to_s
        end
    
        it 'when update of what went wrong is not successful' do
          @sprint = Sprint.create(id: '1', name: 'firstsprint')
          @updatewrong = WhatWentWrong.create(id: '1', body: 'ss', sprint_id: @sprint.id)
          patch :update,
                params: { id: @updatewrong.id, body: @updatewrong.body, sprint_id: @sprint.id, locale: locale }
          expect(JSON.parse(response.body)['message']).to eq('Record with this id is not found')
        end
    end

    describe 'DELETE #destroy' do
        let(:locale) { 'en' }
        it 'destroys the requested post for what went wrong' do
          @sprint = Sprint.create(id: '1', name: 'firstsprint')
          @wrong = WhatWentWrong.create(id: '1', body: 'bodyofwell', sprint_id: @sprint.id)
          post :destroy, params: { id: @wrong.id, locale: locale }
          expect(response).to redirect_to 'http://test.host/' + locale + '/sprints/'
        end
    end
      
    describe 'POST #like' do
        let(:locale) { 'en' }
        it 'Increments the like button of what went wrong when clicked' do
          @sprint = Sprint.create(id: '1', name: 'firstsprint')
          @wrong = WhatWentWrong.create(id: '1', body: 'bodyofwell', sprint_id: @sprint.id, likes: 2)
          @no_like = @wrong.likes
          post :like, params: { id: @wrong.id, sprint_id: @sprint.id, locale: locale }
          if @no_like + 1 == @wrong.likes
            expect(response).to redirect_to 'http://localhost:3000/' + locale + '/sprints/' + @sprint.id.to_s
          end
        end
    end 
end