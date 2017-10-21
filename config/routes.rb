Rails.application.routes.draw do
   resources :vehicles do
     resources :refuellings
     resources :maintenances do
       resources :documents
     end
   end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
