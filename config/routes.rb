Rails.application.routes.draw do
   resources :vehicles do
     resources :refuellings
     resources :maintenances do
       resources :file_uploads, only: [:new, :create, :destroy]
     end
     resources :reminders
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
