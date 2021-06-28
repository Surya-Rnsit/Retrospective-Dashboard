require 'rails_helper'

RSpec.describe SprintsController, type: :controller do
    
    describe '#index' do
        it 'testing show method' do
            get 'index'
            expect(response).to be_success
        end
    end
    
    describe '#show' do
        it 'testing index method' do
            @sprint = Sprint.create(id: '1', name: 'firstsprint')
            post :show, params: { id: @sprint.id }
            expect(response).to be_success
        end
    end

    describe '#create' do
        it 'creates a successful sprint' do
          @createsprint = Sprint.create(id: '1', name: 'somesprint')
          post :create, params: { name: @createsprint.name }
          expect(response).to be_success
        end
        
        it 'creates does not create a successful sprint' do
          @createsprint1 = Sprint.create(id: '1', name: 'firstsprint')
          @createsprint2 = Sprint.create(id: '2', name: 'firstsprint')
          post :create, params: { id: @createsprint2.id, name: @createsprint2.name }
          expect(JSON.parse(response.body)['message']).to eq('Sprint Already Exists or Sprint not created')
        end
    end


    describe 'DELETE #destroy' do
        it 'destroys the requested sprint' do
          @sprint = Sprint.create(id: '1', name: 'firstsprint')
          expect do
            post :destroy, params: { id: @sprint.id, name: @sprint.name }
          end.to change(Sprint, :count).by(-1)
        end
    end 
    
end