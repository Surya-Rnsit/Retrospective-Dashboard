
Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    root 'sprints#index'
    get '/sprints/:id', to: 'sprints#show'

    post '/createWhatWentWell', to: 'what_went_wells#create'
    post '/createWhatWentWrong', to: 'what_went_wrongs#create'
    post '/createImprovements', to: 'improvements#create'
    post '/createActionitems', to: 'action_items#create'
    post '/createSprint', to: 'sprints#create'

    get '/what_went_wells/updateWhatWentWell/:id', to: 'what_went_wells#update'
    patch '/what_went_wells/updateWhatWentWell/:id', to: 'what_went_wells#update'

    get '/what_went_wrongs/updateWhatWentWrong/:id', to: 'what_went_wrongs#update'
    patch '/what_went_wrongs/updateWhatWentWrong/:id', to: 'what_went_wrongs#update'

    get '/improvements/updateImprovements/:id', to: 'improvements#update'
    patch '/improvements/updateImprovements/:id', to: 'improvements#update'

    get '/action_items/updateactionitems/:id', to: 'action_items#update'
    patch '/action_items/updateactionitems/:id', to: 'action_items#update'
    post '/action_items/updatecheckbox/:id', to: 'action_items#update_checkbox'

    post '/what_went_wells/likeWhatWentWell/:id', to: 'what_went_wells#like'
    post '/what_went_wrongs/likeWhatWentWrong/:id', to: 'what_went_wrongs#like'
    post '/improvements/likeImprovements/:id', to: 'improvements#like'

    post '/what_went_wells/destroyWhatWentWell/:id', to: 'what_went_wells#destroy'
    post '/what_went_wrongs/destroyWhatWentWrong/:id', to: 'what_went_wrongs#destroy'
    post '/improvements/destroyImprovements/:id', to: 'improvements#destroy'
    post '/action_items/destroyactionitems/:id', to: 'action_items#destroy'

    post 'sprints/destroySprint/:id', to: 'sprints#destroy'

    post '/action_items/moveActionItems', to: 'action_items#move'
  end
end
