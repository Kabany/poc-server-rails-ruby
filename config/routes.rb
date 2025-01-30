Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  get "/meta/ping", controller: "meta", action: :ping
  get "/meta/health-check", controller: "meta", action: :health_check
  get "/meta/version", controller: "meta", action: :version

  get "/operations/list/params/:times", controller: "operations", action: :send_list_from_params
  get "/operations/list/query", controller: "operations", action: :send_list_from_query
  post "/operations/list/body", controller: "operations", action: :send_list_from_body
  get "/operations/list/headers", controller: "operations", action: :send_list_from_headers

  get "/operations/fibonacci/sum/:number", controller: "operations", action: :send_fibonacci_sum
  get "/operations/fibonacci/list/:number", controller: "operations", action: :send_fibonacci_list
end
