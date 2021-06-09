Rails.application.routes.draw do
  root "dashboards#index"
  get "/dashboards", to: "dashboards#index"

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
end
