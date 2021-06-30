require 'rails_helper'

RSpec.describe ImprovementsController, type: :controller do

    describe '#create' do
        let(:locale) { 'en' }
        let(:sprint) do
          Sprint.create(
            id: '1', 
            name: 'firstsprint'
          )
        end
        it 'creates a successful post for Improvements' do
          @improve = Improvement.create(id: '1', body: 'bodyimprove', sprint_id: sprint.id)
          expect(@improve).to be_an_instance_of Improvement
          post :create,
               params: { id: @improve.id, body: @improve.body, sprint_id: @improve.sprint_id, locale: locale }
          expect(response).to redirect_to 'http://test.host/' + locale + '/sprints/' + sprint.id.to_s
        end
    
        it 'When the body length is less than 5 , Improvements is not created' do
          @improve = Improvement.create(id: '1', body: 'body', sprint_id: sprint.id)
          post :create,
               params: { id: @improve.id, body: @improve.body, sprint_id: @improve.sprint_id, locale: locale }
          expect(JSON.parse(response.body)['message']).to eq('Improvements not created(length of body should be more than 5)')
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
        it 'when update of Improvements is successful' do
          @update = Improvement.create(id: '1', body: 'bodyofimprove', sprint_id: sprint.id)
          patch :update,
                params: { id: @update.id, body: @update.body, sprint_id: sprint.id, locale: locale }
          expect(response).to redirect_to 'http://test.host/' + locale + '/sprints/' + sprint.id.to_s
        end
    
        it 'when update of what went wrong is not successful' do
          @update = WhatWentWrong.create(id: '1', body: 'ss', sprint_id: sprint.id)
          patch :update,
                params: { id: @update.id, body: @update.body, sprint_id: sprint.id, locale: locale }
          expect(JSON.parse(response.body)['message']).to eq('Record with this id is not found')
        end
    end

    describe 'DELETE #destroy' do
        let(:locale) { 'en' }
        it 'destroys the requested post for Improvements' do
          @sprint = Sprint.create(id: '1', name: 'firstsprint')
          @improve = Improvement.create(id: '1', body: 'bodyofwell', sprint_id: @sprint.id)
          post :destroy, params: { id: @improve.id, locale: locale }
          expect(response).to redirect_to 'http://test.host/' + locale + '/sprints/'
        end
    end
      
    describe 'POST #like' do
        let(:locale) { 'en' }
        it 'Increments the like button of Improvements when clicked' do
          @sprint = Sprint.create(id: '1', name: 'firstsprint')
          @improve = Improvement.create(id: '1', body: 'bodyofwell', sprint_id: @sprint.id, likes: 2)
          @no_like = @improve.likes
          post :like, params: { id: @improve.id, sprint_id: @sprint.id, locale: locale }
          if @no_like + 1 == @improve.likes
            expect(response).to redirect_to 'http://localhost:3000/' + locale + '/sprints/' + @sprint.id.to_s
          end
        end
    end 
    
end
