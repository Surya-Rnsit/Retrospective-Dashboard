Rails.application.routes.draw do
  root "dashboards#index"
  get "/dashboards", to: "dashboards#index"

  post "/createWhatWentWell", to: "dashboards#createWhatWentWell"
  post "/createWhatWentWrong", to: "dashboards#createWhatWentWrong"
  post "/createImprovements", to: "dashboards#createImprovements"

  post "/dashboards/destroyWhatWentWell/:id", to: "dashboards#destroyWhatWentWell"
  post "/dashboards/destroyWhatWentWrong/:id", to: "dashboards#destroyWhatWentWrong"
  post "/dashboards/destroyImprovements/:id", to: "dashboards#destroyImprovements"
  
  get "/dashboards/updateWhatWentWell/:id" , to: "dashboards#updateWhatWentWell"
  patch "/dashboards/updateWhatWentWell/:id" , to: "dashboards#updateWhatWentWell"
end
