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
      let(:sprint1) do
        Sprint.create(
          id: '5', 
          name: 'firstsprint'
        )
      end
      let(:sprint2) do
        Sprint.create(
          id: '2', 
          name: 'firstsprint'
        )
      end
        it 'creates a successful sprint' do
          post :create, params: { id: sprint1.id, name: sprint1.name }
          expect(response).to redirect_to 'http://test.host/en' 
        end
        
        it 'does not create a successful sprint' do
          post :create, params: { id: sprint1.id, name: sprint2.name }
          expect(response).to redirect_to 'http://test.host/en'
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
