Rails.application.routes.draw do
  root "static_pages#landing_page"
  #get 'static_pages/landing_page'
  get 'static_pages/privacy_page'
  get "privacy_page", to:"static_pages#privacy_page"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
