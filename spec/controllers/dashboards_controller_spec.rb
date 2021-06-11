require "rails_helper"

RSpec.describe DashboardsController , type: :controller do

    describe "#index" do
        it "returns all the records" do
            get 'index'
            expect(response).to be_success
        end
    end

  # tests for Create Actions

    describe "#createWhatWentWell" do
        it "creates a successful post for what went well" do
            @well = WhatWentWell.create(id:"1" ,body: "bodyofwell")
            expect(@well).to be_an_instance_of WhatWentWell
            post :createWhatWentWell, params: {id: @well.id,body: @well.body}
            expect(response).to redirect_to dashboards_path
        end

        it "When the body length is less than 5 , record is not created" do
            @well = WhatWentWell.create(id:"1" ,body: "body")
            post :createWhatWentWell, params: {id: @well.id,body: @well.body}
            expect(JSON.parse(response.body)['message']).to eq('createWhatWentWell not created(length of body should be more than 5)')
        end
    end

    describe "#createWhatWentWrong" do
        it "creates a successful post for what went wrong" do
            @wrong = WhatWentWrong.create(id:"1" ,body: "bodywrong")
            expect(@wrong).to be_an_instance_of WhatWentWrong
            post :createWhatWentWrong, params: {id: @wrong.id,body: @wrong.body}
            expect(response).to redirect_to dashboards_path
        end

        it "When the body length is less than 5 , record is not created" do
            @wrong = WhatWentWrong.create(id:"1" ,body: "body")
            post :createWhatWentWrong, params: {id: @wrong.id,body: @wrong.body}
            expect(JSON.parse(response.body)['message']).to eq('createWhatWentWrong not created(length of body should be more than 5)')
        end
    end

    describe "#createImprovements" do
        it "creates a successful post for what went Improvements" do
            @improve = Improvement.create(id:"1" ,body: "bodyimprove")
            expect(@improve).to be_an_instance_of Improvement
            post :createImprovements, params: {id: @improve.id,body: @improve.body}
            expect(response).to redirect_to dashboards_path
        end

        it "When the body length is less than 5 , record is not created" do
            @improve = Improvement.create(id:"1" ,body: "body")
            post :createImprovements, params: {id: @improve.id,body: @improve.body}
            expect(JSON.parse(response.body)['message']).to eq('Improvements not created(length of body should be more than 5)')
        end
    end
   
    describe "#createActionitems" do
        it "creates a successful post for what went Actionitems" do
            @action = Actionitem.create(id:"1" ,body: "bodyaction")
            expect(@action).to be_an_instance_of Actionitem
            post :createActionitems, params: {id: @action.id,body: @action.body}
            expect(response).to redirect_to dashboards_path
        end
        it "When the body length is less than 5 , record is not created" do
            @action = Improvement.create(id:"1" ,body: "body")
            post :createActionitems, params: {id: @action.id,body: @action.body}
            expect(JSON.parse(response.body)['message']).to eq('createActionitems not created')
        end
    end


    #tests for Update Actions 

    describe "PATCH #updateWhatWentWell" do
        it "when update of what went well is successful" do
            @updatewell = WhatWentWell.create(id:"1" ,body: "bodyofwell")
            patch :updateWhatWentWell, params: {id: @updatewell.id,body: @updatewell.body}
            expect(response).to redirect_to dashboards_path
        end

        it "when update of what went well is not successful" do
            @updatewell = WhatWentWell.create(id:"1" ,body: "ss")
            patch :updateWhatWentWell, params: {id: @updatewell.id,body: @updatewell.body}
            expect(JSON.parse(response.body)['message']).to eq('Record with this id is not found')
        end
    end

    describe "PATCH #updateWhatWentWrong" do
        it "when update of what went wrong is successful" do
            @updatewrong = WhatWentWrong.create(id:"1" ,body: "bodyofwrong")
            patch :updateWhatWentWrong, params: {id: @updatewrong.id,body: @updatewrong.body}
            expect(response).to redirect_to dashboards_path
        end

        it "when update of what went wrong is not successful" do
            @updatewrong = WhatWentWrong.create(id:"1" ,body: "ss")
            patch :updateWhatWentWrong, params: {id: @updatewrong.id,body: @updatewrong.body}
            expect(JSON.parse(response.body)['message']).to eq('Record with this id is not found')
        end
    end

    describe "PATCH #updateImprovements" do
        it "when update of Improvements is successful" do
            @update = Improvement.create(id:"1" ,body: "bodyofimprove")
            patch :updateImprovements, params: {id: @update.id,body: @update.body}
            expect(response).to redirect_to dashboards_path
        end

        it "when update of what went wrong is not successful" do
            @update = WhatWentWrong.create(id:"1" ,body: "ss")
            patch :updateImprovements, params: {id: @update.id,body: @update.body}
            expect(JSON.parse(response.body)['message']).to eq('Record with this id is not found')
        end
    end

    describe "PATCH #updateActionitems" do
        it "when update of action is successful" do
            @update = Actionitem.create(id:"1" ,body: "bodyofaction")
            patch :updateActionitems, params: {id: @update.id,body: @update.body}
            expect(response).to redirect_to dashboards_path
        end

        it "when update of what went wrong is not successful" do
            @update = Actionitem.create(id:"1" ,body: "ss")
            patch :updateActionitems, params: {id: @update.id,body: @update.body}
            expect(JSON.parse(response.body)['message']).to eq('Record with this id is not found')
        end
    end

    #tests for Delete actions

    describe "DELETE #destroyWhatWentWell" do
        it "destroys the requested post for what went well" do
            @well = WhatWentWell.create(id:"1" ,body: "bodyofwell")
            expect {
                post :destroyWhatWentWell, params: {id: @well.id}
              }.to change(WhatWentWell, :count).by(-1)
        end
    end


    describe "DELETE #destroyWhatWentWrong" do
        it "destroys the requested post for what went wrong" do
            @wrong = WhatWentWrong.create(id:"1" ,body: "bodyofwell")
            expect {
                post :destroyWhatWentWrong, params: {id: @wrong.id}
              }.to change(WhatWentWrong, :count).by(-1)
        end
    end

    describe "DELETE #destroyImprovements" do
        it "destroys the requested post for Improvements" do
            @improve = Improvement.create(id:"1" ,body: "bodyofwell")
            expect {
                post :destroyImprovements, params: {id: @improve.id}
              }.to change(Improvement, :count).by(-1)
        end
    end

    describe "DELETE #destroyactionitems" do
        it "destroys the requested post for actionitems" do
            @action = Actionitem.create(id:"1" ,body: "bodyofwell")
            expect {
                post :destroyactionitems, params: {id: @action.id}
              }.to change(Actionitem, :count).by(-1)
        end
    end
end