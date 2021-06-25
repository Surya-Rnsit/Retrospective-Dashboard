Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    root 'dashboards#show'
    get '/dashboards/:id', to: 'dashboards#index'

    post '/createWhatWentWell', to: 'dashboards#create_whatwentwell'
    post '/createWhatWentWrong', to: 'dashboards#create_whatwentwrong'
    post '/createImprovements', to: 'dashboards#create_improvements'
    post '/createActionitems', to: 'dashboards#create_actionitems'

    post '/dashboards/destroyWhatWentWell/:id', to: 'dashboards#destroy_whatwentwell'
    post '/dashboards/destroyWhatWentWrong/:id', to: 'dashboards#destroy_whatwentwrong'
    post '/dashboards/destroyImprovements/:id', to: 'dashboards#destroy_improvements'
    post '/dashboards/destroyactionitems/:id', to: 'dashboards#destroy_actionitems'

    get '/dashboards/updateWhatWentWell/:id', to: 'dashboards#update_whatwentwell'
    patch '/dashboards/updateWhatWentWell/:id', to: 'dashboards#update_whatwentwell'

    get '/dashboards/updateWhatWentWrong/:id', to: 'dashboards#update_whatwentwrong'
    patch '/dashboards/updateWhatWentWrong/:id', to: 'dashboards#update_whatwentwrong'

    get '/dashboards/updateImprovements/:id', to: 'dashboards#update_improvements'
    patch '/dashboards/updateImprovements/:id', to: 'dashboards#update_improvements'

    get '/dashboards/updateactionitems/:id', to: 'dashboards#update_actionitems'
    patch '/dashboards/updateactionitems/:id', to: 'dashboards#update_actionitems'
    post '/dashboards/updatecheckbox/:id', to: 'dashboards#update_checkbox'

    post '/dashboards/likeWhatWentWell/:id', to: 'dashboards#like_whatwentwell'
    post '/dashboards/likeWhatWentWrong/:id', to: 'dashboards#like_whatwentwrong'
    post '/dashboards/likeImprovements/:id', to: 'dashboards#like_improvements'

    post '/createSprint', to: 'dashboards#create_sprint'
    post 'dashboards/destroySprint/:id', to: 'dashboards#destroy_sprint'

    post '/dashboards/moveActionItems', to: 'dashboards#move_actionitems'
  end
end
