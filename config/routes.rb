Rails.application.routes.draw do
  root "dashboards#index"
  get "/dashboards", to: "dashboards#index"
 # post "/dashboard", to: "dashboard#createWhatWentWell"
  post "/newWhatWentWell", to: "dashboards#newWhatWentWell"
  post "/createWhatWentWell", to: "dashboards#createWhatWentWell"
end
