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
        let(:locale) {"en"}
        it "creates a successful post for what went well" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @well = WhatWentWell.create(id:"1" ,body: "bodyofwell",sprint_id: @sprint.id)
            expect(@well).to be_an_instance_of WhatWentWell
            post :createWhatWentWell, params: {id: @well.id,body: @well.body,sprint_id: @well.sprint_id, locale: locale}
            expect(response).to redirect_to 'http://localhost:3000/'+locale+'/dashboards/'+ @sprint.id.to_s
        end

        it "When the body length is less than 5 , what went well is not created" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @well = WhatWentWell.create(id:"1" ,body: "body",sprint_id: @sprint.id)
            post :createWhatWentWell, params: {id: @well.id,body: @well.body,sprint_id: @well.sprint_id, locale: locale}
            expect(JSON.parse(response.body)['message']).to eq('createWhatWentWell not created(length of body should be more than 5)')
        end
    end

    describe "#createWhatWentWrong" do
        let(:locale) {"en"}
        it "creates a successful post for what went wrong" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @wrong = WhatWentWrong.create(id:"1" ,body: "bodywrong",sprint_id:@sprint.id)
            expect(@wrong).to be_an_instance_of WhatWentWrong
            post :createWhatWentWrong, params: {id: @wrong.id,body: @wrong.body,sprint_id: @wrong.sprint_id, locale: locale}
            expect(response).to redirect_to 'http://localhost:3000/'+locale+'/dashboards/'+@sprint.id.to_s
        end

        it "When the body length is less than 5 , what went wrong is not created" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @wrong = WhatWentWrong.create(id:"1" ,body: "body",sprint_id: @sprint.id)
            post :createWhatWentWrong, params: {id: @wrong.id,body: @wrong.body,sprint_id: @wrong.sprint_id, locale: locale}
            expect(JSON.parse(response.body)['message']).to eq('createWhatWentWrong not created(length of body should be more than 5)')
        end
    end

    describe "#createImprovements" do
        let(:locale) {"en"}
        it "creates a successful post for Improvements" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @improve = Improvement.create(id:"1" ,body: "bodyimprove",sprint_id: @sprint.id)
            expect(@improve).to be_an_instance_of Improvement
            post :createImprovements, params: {id: @improve.id,body: @improve.body,sprint_id: @improve.sprint_id, locale: locale}
            expect(response).to redirect_to 'http://localhost:3000/'+locale+'/dashboards/'+@sprint.id.to_s
        end

        it "When the body length is less than 5 , Improvements is not created" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @improve = Improvement.create(id:"1" ,body: "body",sprint_id: @sprint.id)
            post :createImprovements, params: {id: @improve.id,body: @improve.body,sprint_id: @improve.sprint_id, locale: locale}
            expect(JSON.parse(response.body)['message']).to eq('Improvements not created(length of body should be more than 5)')
        end
    end
   
    describe "#createActionitems" do
        let(:locale) {"en"}
        it "creates a successful post for Actionitems" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @action = Actionitem.create(id:"1" ,body: "bodyaction",sprint_id: @sprint.id)
            expect(@action).to be_an_instance_of Actionitem
            post :createActionitems, params: {id: @action.id,body: @action.body,sprint_id: @action.sprint_id, locale: locale}
            expect(response).to redirect_to 'http://localhost:3000/'+locale+'/dashboards/'+@sprint.id.to_s
        end
        it "When the body length is less than 5 , Actionitems is not created" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @action = Improvement.create(id:"1" ,body: "body",sprint_id: @sprint.id)
            post :createActionitems, params: {id: @action.id,body: @action.body,sprint_id: @action.sprint_id, locale: locale}
            expect(JSON.parse(response.body)['message']).to eq('createActionitems not created')
        end
    end

  
    describe "#createSprint" do
        it "creates a successful sprint" do
            @createsprint=Sprint.create(id: "1", name: "somesprint")
            post :createSprint, params: {name: @createsprint.name}
            expect(response).to be_success
        end
        it "creates does not create a successful sprint" do
            @createsprint1=Sprint.create(id: "1", name: "firstsprint")
            @createsprint2=Sprint.create(id: "2", name: "firstsprint")
            post :createSprint, params: {id:@createsprint2.id, name: @createsprint2.name}
            expect(JSON.parse(response.body)['message']).to eq('Sprint Already Exists or Sprint not created')
        end
    end

    #tests for Update Actions 

    describe "PATCH #updateWhatWentWell" do
        let(:locale) {"en"}
        it "when update of what went well is successful" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @updatewell = WhatWentWell.create(id:"1" ,body: "bodyofwell",sprint_id: @sprint.id)
            patch :updateWhatWentWell, params: {id: @updatewell.id,body: @updatewell.body,sprint_id: @sprint.id, locale: locale}
            expect(response).to  redirect_to 'http://localhost:3000/'+locale+'/dashboards/'+@sprint.id.to_s
        end

        it "when update of what went well is not successful" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @updatewell = WhatWentWell.create(id:"1" ,body: "ss",sprint_id: @sprint.id)
            patch :updateWhatWentWell, params: {id: @updatewell.id,body: @updatewell.body,sprint_id: @updatewell.id, locale: locale}
            expect(JSON.parse(response.body)['message']).to eq('Record with this id is not found')
        end
    end

    describe "PATCH #updateWhatWentWrong" do
        let(:locale) {"en"}
        it "when update of what went wrong is successful" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @updatewrong = WhatWentWrong.create(id:"1" ,body: "bodyofwrong",sprint_id: @sprint.id)
            patch :updateWhatWentWrong, params: {id: @updatewrong.id,body: @updatewrong.body,sprint_id: @sprint.id, locale: locale}
            expect(response).to redirect_to 'http://localhost:3000/'+locale+'/dashboards/'+ @sprint.id.to_s
        end

        it "when update of what went wrong is not successful" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @updatewrong = WhatWentWrong.create(id:"1" ,body: "ss",sprint_id: @sprint.id)
            patch :updateWhatWentWrong, params: {id: @updatewrong.id,body: @updatewrong.body,sprint_id: @sprint.id, locale: locale}
            expect(JSON.parse(response.body)['message']).to eq('Record with this id is not found')
        end
    end

    describe "PATCH #updateImprovements" do
        let(:locale) {"en"}
        it "when update of Improvements is successful" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @update = Improvement.create(id:"1" ,body: "bodyofimprove",sprint_id: @sprint.id)
            patch :updateImprovements, params: {id: @update.id,body: @update.body,sprint_id: @sprint.id, locale: locale}
            expect(response).to redirect_to 'http://localhost:3000/'+locale+'/dashboards/'+ @sprint.id.to_s
        end

        it "when update of what went wrong is not successful" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @update = WhatWentWrong.create(id:"1" ,body: "ss",sprint_id: @sprint.id)
            patch :updateImprovements, params: {id: @update.id,body: @update.body,sprint_id: @sprint.id, locale: locale}
            expect(JSON.parse(response.body)['message']).to eq('Record with this id is not found')
        end
    end

    describe "PATCH #updateActionitems" do
        let(:locale) {"en"}
        it "when update of action is successful" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @update = Actionitem.create(id:"1" ,body: "bodyofaction",sprint_id: @sprint.id)
            patch :updateActionitems, params: {id: @update.id,body: @update.body,sprint_id: @sprint.id, locale: locale}
            expect(response).to redirect_to 'http://localhost:3000/'+locale+'/dashboards/'+ @sprint.id.to_s
        end

        it "when update of what went wrong is not successful" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @update = Actionitem.create(id:"1" ,body: "ss")
            patch :updateActionitems, params: {id: @update.id,body: @update.body,sprint_id: @sprint.id, locale: locale}
            expect(JSON.parse(response.body)['message']).to eq('Record with this id is not found')
        end
    end

    #tests for Delete actions

    describe "DELETE #destroyWhatWentWell" do
        let(:locale) {"en"}
        it "destroys the requested post for what went well" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @well = WhatWentWell.create(id:"1" ,body: "bodyofwell",sprint_id: @sprint.id)
            post :destroyWhatWentWell, params: {id: @well.id, locale: locale}
            expect(response).to redirect_to 'http://localhost:3000/'+locale+'/dashboards/'
        end
    end


    describe "DELETE #destroyWhatWentWrong" do
        let(:locale) {"en"}
        it "destroys the requested post for what went wrong" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @wrong = WhatWentWrong.create(id:"1" ,body: "bodyofwell",sprint_id: @sprint.id)
            post :destroyWhatWentWrong, params: {id: @wrong.id, locale: locale}
            expect(response).to redirect_to 'http://localhost:3000/'+locale+'/dashboards/'  
        end
    end

    describe "DELETE #destroyImprovements" do
        let(:locale) {"en"}
        it "destroys the requested post for Improvements" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @improve = Improvement.create(id:"1" ,body: "bodyofwell",sprint_id: @sprint.id)
            post :destroyImprovements, params: {id: @improve.id, locale: locale}
            expect(response).to redirect_to 'http://localhost:3000/'+locale+'/dashboards/' 
        end
    end

    describe "DELETE #destroyactionitems" do
        let(:locale) {"en"}
        it "destroys the requested post for actionitems" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @action = Actionitem.create(id:"1" ,body: "bodyofwell",sprint_id: @sprint.id)
            post :destroyactionitems, params: {id: @action.id, locale: locale}
            expect(response).to redirect_to 'http://localhost:3000/'+locale+'/dashboards/' 
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
        let(:locale) {"en"}
        it "Increments the like button of what went well when clicked" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @well = WhatWentWell.create(id:"1" ,body: "bodyofwell",sprint_id: @sprint.id,likes: 2)
            @no_like=@well.likes
            post :likeWhatWentWell, params: {id: @well.id,sprint_id: @sprint.id, locale: locale}
            if(@no_like+1==@well.likes)
                expect(response).to redirect_to 'http://localhost:3000/'+locale+'/dashboards/'+@sprint.id.to_s
            end
        end
    end

    describe "POST #likeWhatWentWrong" do
        let(:locale) {"en"}
        it "Increments the like button of what went wrong when clicked" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @wrong = WhatWentWrong.create(id:"1" ,body: "bodyofwell",sprint_id: @sprint.id,likes: 2)
            @no_like=@wrong.likes
            post :likeWhatWentWrong, params: {id: @wrong.id,sprint_id: @sprint.id, locale: locale}
            if(@no_like+1==@wrong.likes)
                expect(response).to redirect_to 'http://localhost:3000/'+locale+'/dashboards/'+@sprint.id.to_s
            end
        end
    end

    describe "POST #likeImprovements" do
        let(:locale) {"en"}
        it "Increments the like button of Improvements when clicked" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @improve = Improvement.create(id:"1" ,body: "bodyofwell",sprint_id: @sprint.id,likes: 2)
            @no_like=@improve.likes
            post :likeImprovements, params: {id: @improve.id,sprint_id: @sprint.id, locale: locale}
            if(@no_like+1==@improve.likes)
                expect(response).to redirect_to 'http://localhost:3000/'+locale+'/dashboards/'+@sprint.id.to_s
            end
        end
    end

    describe "POST #updatecheckbox" do
        let(:locale) {"en"}
        it "update checkbox when ischeck is true" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @action = Actionitem.create(id:"1" ,body: "bodyofwell",sprint_id: @sprint.id,ischeck: "true")
            post :updatecheckbox, params: {id: @action.id,sprint_id: @sprint.id, locale: locale}
            if(@action.ischeck==true)
                @action.update(ischeck: false)
                redirect_to 'http://localhost:3000/'+locale+'/dashboards/'+@sprint.id.to_s
            end
        end

        it "update checkbox when ischeck is false" do
            @sprint=Sprint.create(id:"1",name:"firstsprint")
            @action = Actionitem.create(id:"1" ,body: "bodyofwell",sprint_id: @sprint.id,ischeck: "false")
            post :updatecheckbox, params: {id: @action.id,sprint_id: @sprint.id, locale: locale}
            @action.update(ischeck: true)
            if(@action.ischeck==false)
                @action.update(ischeck: true)
                redirect_to 'http://localhost:3000/'+locale+'/dashboards/'+@sprint.id.to_s
            end
        end
    end

    describe "POST #moveActionItems" do
        let(:locale) {"en"} 
        it "When moving unchecked action items to a selected sprint" do
            @current = Sprint.create(id:"1",name:"current")
            @action = Actionitem.create(id:"1" ,body: "bodyofwell",sprint_id: @current.id,ischeck: "false")
            @destination = Sprint.create(id:"2",name:"destination")
            post :moveActionItems, params: {action_id: @action.id,sprint_id: @current.id, moveto:@destination.id , locale: locale} 
            @newaction = Actionitem.create(id:@action.id,body: @action.body,sprint_id: @destination.id,ischeck: "false")  
            @action.destroy
            redirect_to 'http://localhost:3000/'+locale+'/dashboards/'+ @current.id.to_s   
        end
    end
end