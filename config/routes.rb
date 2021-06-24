Rails.application.routes.draw do
 scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do 
    root "dashboards#show"
    get "/dashboards/:id", to: "dashboards#index"
    post "/dashboards/moveActionItems", to: "dashboards#moveActionItems"

    post "/createWhatWentWell", to: "dashboards#createWhatWentWell"
    post "/createWhatWentWrong", to: "dashboards#createWhatWentWrong"
    post "/createImprovements", to: "dashboards#createImprovements"
    post "/createActionitems", to: "dashboards#createActionitems"

    post "/dashboards/destroyWhatWentWell/:id", to: "dashboards#destroyWhatWentWell"
    post "/dashboards/destroyWhatWentWrong/:id", to: "dashboards#destroyWhatWentWrong"
    post "/dashboards/destroyImprovements/:id", to: "dashboards#destroyImprovements"
    post "/dashboards/destroyactionitems/:id", to: "dashboards#destroyactionitems"
    
    get "/dashboards/updateWhatWentWell/:id" , to: "dashboards#updateWhatWentWell"
    patch "/dashboards/updateWhatWentWell/:id" , to: "dashboards#updateWhatWentWell"
    
    get "/dashboards/updateWhatWentWrong/:id" , to: "dashboards#updateWhatWentWrong"
    patch "/dashboards/updateWhatWentWrong/:id" , to: "dashboards#updateWhatWentWrong"

    get "/dashboards/updateImprovements/:id" , to: "dashboards#updateImprovements"
    patch "/dashboards/updateImprovements/:id" , to: "dashboards#updateImprovements"

    get "/dashboards/updateactionitems/:id" , to: "dashboards#updateActionitems"
    patch "/dashboards/updateactionitems/:id" , to: "dashboards#updateActionitems"
    post "/dashboards/updatecheckbox/:id" , to: "dashboards#updatecheckbox"

    post"/dashboards/likeWhatWentWell/:id" , to: "dashboards#likeWhatWentWell"
    post"/dashboards/likeWhatWentWrong/:id" , to: "dashboards#likeWhatWentWrong"
    post"/dashboards/likeImprovements/:id" , to: "dashboards#likeImprovements"

    post"/createSprint" , to: "dashboards#createSprint"
    post "dashboards/destroySprint/:id", to: "dashboards#destroySprint"
end  
end
