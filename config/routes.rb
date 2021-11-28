Rails.application.routes.draw do

  get 'schedules/edit'
  resources :schedules, only: [:edit, :update]

  root 'static_pages#top'
  get '/signup', to: 'users#new'
  

  # ログイン機能
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users do
    collection { post :import }
    
    member do
      get 'index_basic_time'
      get 'edit_basic_time_info'
      patch 'update_basic_time_info'
      get 'employees_working'
      get 'edit_basic_info'
      get 'edit_all_basic_info'
      get 'confirmation_show'
      patch 'update_basic_info'
      get 'attendances/edit_one_month'
      patch 'attendances/update_one_month' # この行が追加対象です。
      get 'attendances/edit_overtime_request'
      patch 'attendances/update_overtime_request'
      get 'attendances/recive_overtime_request'
      # get 'attend_employees'
      get 'attendances/one_month_request'
      patch 'attendances/update_one_month_request'
      patch 'attendances/confirmation_one_month_request'
      get 'attendances/edit_overtime_request'
      patch 'attendances/update_overtime_request'
      get 'attendances/recive_overtime_request'
      patch 'attendances/confirmation_overtime_request'
      get 'attendances/recive_change_attendance_request'
      patch 'attendances/confirmation_change_attendance_request'
      get 'attendances/edit_log'
    
    end
    resources :attendances, only: [:edit, :update]
    resources :locations, only: [:index, :create, :edit, :update, :destroy]

  end
  
end
