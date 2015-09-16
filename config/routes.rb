Rails.application.routes.draw do
  get 'report/scale'

  resources :scales, :only => [:index, :edit, :scale_save]
  resources :stays
  resources :backups
  resources :jobs
  resources :works
  resources :works
  resources :service_servers
  resources :services
  resources :servers
  resources :type_users
  

  get 'manage/admin'

  get 'manage/stay'

  get 'manage/wrong'

  

  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'manage#admin'

  get 'scales/scale_save'

end

