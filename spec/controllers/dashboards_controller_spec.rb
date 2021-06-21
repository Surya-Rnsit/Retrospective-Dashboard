require "rails_helper"

RSpec.describe DashboardsController , type: :controller do

    describe "#index" do
        it "testing index method" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            post :index, params: {id: @sprint.id}
            expect(response).to be_success
        end
    end

    describe "#show" do
        it "testing show method" do
            get 'show'
            expect(response).to be_success
        end
    end
  # tests for Create Actions

    describe "#createWhatWentWell" do
        it "creates a successful post for what went well" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @well = WhatWentWell.create(id:"1" ,body: "bodyofwell",sprint_id: @sprint.id)
            expect(@well).to be_an_instance_of WhatWentWell
            post :createWhatWentWell, params: {id: @well.id,body: @well.body,sprint_id: @well.sprint_id}
            expect(response).to redirect_to 'http://localhost:3000/dashboards/'+@sprint.id.to_s
        end

        it "When the body length is less than 5 , what went well is not created" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @well = WhatWentWell.create(id:"1" ,body: "body",sprint_id: @sprint.id)
            post :createWhatWentWell, params: {id: @well.id,body: @well.body,sprint_id: @well.sprint_id}
            expect(JSON.parse(response.body)['message']).to eq('createWhatWentWell not created(length of body should be more than 5)')
        end
    end

    describe "#createWhatWentWrong" do
        it "creates a successful post for what went wrong" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @wrong = WhatWentWrong.create(id:"1" ,body: "bodywrong",sprint_id:@sprint.id)
            expect(@wrong).to be_an_instance_of WhatWentWrong
            post :createWhatWentWrong, params: {id: @wrong.id,body: @wrong.body,sprint_id: @wrong.sprint_id}
            expect(response).to redirect_to 'http://localhost:3000/dashboards/'+@sprint.id.to_s
        end

        it "When the body length is less than 5 , what went wrong is not created" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @wrong = WhatWentWrong.create(id:"1" ,body: "body",sprint_id: @sprint.id)
            post :createWhatWentWrong, params: {id: @wrong.id,body: @wrong.body,sprint_id: @wrong.sprint_id}
            expect(JSON.parse(response.body)['message']).to eq('createWhatWentWrong not created(length of body should be more than 5)')
        end
    end

    describe "#createImprovements" do
        it "creates a successful post for Improvements" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @improve = Improvement.create(id:"1" ,body: "bodyimprove",sprint_id: @sprint.id)
            expect(@improve).to be_an_instance_of Improvement
            post :createImprovements, params: {id: @improve.id,body: @improve.body,sprint_id: @improve.sprint_id}
            expect(response).to redirect_to 'http://localhost:3000/dashboards/'+@sprint.id.to_s
        end

        it "When the body length is less than 5 , Improvements is not created" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @improve = Improvement.create(id:"1" ,body: "body",sprint_id: @sprint.id)
            post :createImprovements, params: {id: @improve.id,body: @improve.body,sprint_id: @improve.sprint_id}
            expect(JSON.parse(response.body)['message']).to eq('Improvements not created(length of body should be more than 5)')
        end
    end
   
    describe "#createActionitems" do
        it "creates a successful post for what went Actionitems" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @action = Actionitem.create(id:"1" ,body: "bodyaction",sprint_id: @sprint.id)
            expect(@action).to be_an_instance_of Actionitem
            post :createActionitems, params: {id: @action.id,body: @action.body,sprint_id: @action.sprint_id}
            expect(response).to redirect_to 'http://localhost:3000/dashboards/'+@sprint.id.to_s
        end
        it "When the body length is less than 5 , Actionitems is not created" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @action = Improvement.create(id:"1" ,body: "body",sprint_id: @sprint.id)
            post :createActionitems, params: {id: @action.id,body: @action.body,sprint_id: @action.sprint_id}
            expect(JSON.parse(response.body)['message']).to eq('createActionitems not created')
        end
    end

    describe "#createSprint" do
        it "creates a successful sprint" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @well = WhatWentWell.create(id:"1" ,body: "bodyofwell",sprint_id: @sprint.id)
            expect(@sprint).to be_an_instance_of Sprint
            post :createSprint, params: {id: @sprint.id,name: @sprint.name}
            expect(response).to redirect_to 'http://localhost:3000/dashboards/'
        end
    end

    #tests for Update Actions 

    describe "PATCH #updateWhatWentWell" do
        it "when update of what went well is successful" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @updatewell = WhatWentWell.create(id:"1" ,body: "bodyofwell",sprint_id: @sprint.id)
            patch :updateWhatWentWell, params: {id: @updatewell.id,body: @updatewell.body,sprint_id: @sprint.id}
            expect(response).to  redirect_to 'http://localhost:3000/dashboards/'+@sprint.id.to_s
        end

        it "when update of what went well is not successful" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @updatewell = WhatWentWell.create(id:"1" ,body: "ss",sprint_id: @sprint.id)
            patch :updateWhatWentWell, params: {id: @updatewell.id,body: @updatewell.body,sprint_id: @updatewell.id}
            expect(JSON.parse(response.body)['message']).to eq('Record with this id is not found')
        end
    end

    describe "PATCH #updateWhatWentWrong" do
        it "when update of what went wrong is successful" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @updatewrong = WhatWentWrong.create(id:"1" ,body: "bodyofwrong",sprint_id: @sprint.id)
            patch :updateWhatWentWrong, params: {id: @updatewrong.id,body: @updatewrong.body,sprint_id: @sprint.id}
            expect(response).to redirect_to 'http://localhost:3000/dashboards/'+ @sprint.id.to_s
        end

        it "when update of what went wrong is not successful" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @updatewrong = WhatWentWrong.create(id:"1" ,body: "ss",sprint_id: @sprint.id)
            patch :updateWhatWentWrong, params: {id: @updatewrong.id,body: @updatewrong.body,sprint_id: @sprint.id}
            expect(JSON.parse(response.body)['message']).to eq('Record with this id is not found')
        end
    end

    describe "PATCH #updateImprovements" do
        it "when update of Improvements is successful" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @update = Improvement.create(id:"1" ,body: "bodyofimprove",sprint_id: @sprint.id)
            patch :updateImprovements, params: {id: @update.id,body: @update.body,sprint_id: @sprint.id}
            expect(response).to redirect_to 'http://localhost:3000/dashboards/'+ @sprint.id.to_s
        end

        it "when update of what went wrong is not successful" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @update = WhatWentWrong.create(id:"1" ,body: "ss",sprint_id: @sprint.id)
            patch :updateImprovements, params: {id: @update.id,body: @update.body,sprint_id: @sprint.id}
            expect(JSON.parse(response.body)['message']).to eq('Record with this id is not found')
        end
    end

    describe "PATCH #updateActionitems" do
        it "when update of action is successful" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @update = Actionitem.create(id:"1" ,body: "bodyofaction",sprint_id: @sprint.id)
            patch :updateActionitems, params: {id: @update.id,body: @update.body,sprint_id: @sprint.id}
            expect(response).to redirect_to 'http://localhost:3000/dashboards/'+ @sprint.id.to_s
        end

        it "when update of what went wrong is not successful" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @update = Actionitem.create(id:"1" ,body: "ss")
            patch :updateActionitems, params: {id: @update.id,body: @update.body,sprint_id: @sprint.id}
            expect(JSON.parse(response.body)['message']).to eq('Record with this id is not found')
        end
    end

    #tests for Delete actions

    describe "DELETE #destroyWhatWentWell" do
        it "destroys the requested post for what went well" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @well = WhatWentWell.create(id:"1" ,body: "bodyofwell",sprint_id: @sprint.id)
            expect {
                post :destroyWhatWentWell, params: {id: @well.id}
              }.to change(WhatWentWell, :count).by(-1)
        end
    end


    describe "DELETE #destroyWhatWentWrong" do
        it "destroys the requested post for what went wrong" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @wrong = WhatWentWrong.create(id:"1" ,body: "bodyofwell",sprint_id: @sprint.id)
            expect {
                post :destroyWhatWentWrong, params: {id: @wrong.id}
              }.to change(WhatWentWrong, :count).by(-1)
        end
    end

    describe "DELETE #destroyImprovements" do
        it "destroys the requested post for Improvements" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @improve = Improvement.create(id:"1" ,body: "bodyofwell",sprint_id: @sprint.id)
            expect {
                post :destroyImprovements, params: {id: @improve.id}
              }.to change(Improvement, :count).by(-1)
        end
    end

    describe "DELETE #destroyactionitems" do
        it "destroys the requested post for actionitems" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @action = Actionitem.create(id:"1" ,body: "bodyofwell",sprint_id: @sprint.id)
            expect {
                post :destroyactionitems, params: {id: @action.id}
              }.to change(Actionitem, :count).by(-1)
        end
    end

    describe "DELETE #destroySprint" do
        it "destroys the requested sprint" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            expect {
                post :destroySprint, params: {id: @sprint.id,name: @sprint.name}
              }.to change(Sprint, :count).by(-1)
        end
    end


    describe "POST #likeWhatWentWell" do
        it "Increments the like button of what went well when clicked" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @well = WhatWentWell.create(id:"1" ,body: "bodyofwell",sprint_id: @sprint.id,likes: 2)
            @no_like=@well.likes
            post :likeWhatWentWell, params: {id: @well.id,sprint_id: @sprint.id}
            if(@no_like+1==@well.likes)
                expect(response).to redirect_to 'http://localhost:3000/dashboards/'+@sprint.id.to_s
            end
        end
    end

    describe "POST #likeWhatWentWrong" do
        it "Increments the like button of what went wrong when clicked" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @wrong = WhatWentWrong.create(id:"1" ,body: "bodyofwell",sprint_id: @sprint.id,likes: 2)
            @no_like=@wrong.likes
            post :likeWhatWentWrong, params: {id: @wrong.id,sprint_id: @sprint.id}
            if(@no_like+1==@wrong.likes)
                expect(response).to redirect_to 'http://localhost:3000/dashboards/'+@sprint.id.to_s
            end
        end
    end

    describe "POST #likeImprovements" do
        it "Increments the like button of Improvements when clicked" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @improve = Improvement.create(id:"1" ,body: "bodyofwell",sprint_id: @sprint.id,likes: 2)
            @no_like=@improve.likes
            post :likeImprovements, params: {id: @improve.id,sprint_id: @sprint.id}
            if(@no_like+1==@improve.likes)
                expect(response).to redirect_to 'http://localhost:3000/dashboards/'+@sprint.id.to_s
            end
        end
    end

    describe "POST #updatecheckbox" do
        it "update checkbox when ischeck is true" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @action = Actionitem.create(id:"1" ,body: "bodyofwell",sprint_id: @sprint.id,ischeck: "true")
            post :updatecheckbox, params: {id: @action.id,sprint_id: @sprint.id}
            if(@action.ischeck==true)
                @action.update(ischeck: false)
                redirect_to 'http://localhost:3000/dashboards/'+@sprint.id.to_s
            end
        end

        it "update checkbox when ischeck is false" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @action = Actionitem.create(id:"1" ,body: "bodyofwell",sprint_id: @sprint.id,ischeck: "false")
            post :updatecheckbox, params: {id: @action.id,sprint_id: @sprint.id}
            @action.update(ischeck: true)
            if(@action.ischeck==false)
                @action.update(ischeck: true)
                redirect_to 'http://localhost:3000/dashboards/'+@sprint.id.to_s
            end
        end
    end
end