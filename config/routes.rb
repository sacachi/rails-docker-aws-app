Rails.application.routes.draw do
  root to: "home#index"
  post "/increment_async", to: "home#increment_async"
end
