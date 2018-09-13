Rails.application.routes.draw do
  resources :organizations do
    resources :academic_calendars, path: 'academic-calendars', only: :create
  end

  resources :academic_calendars, path: 'academic-calendars', except: :create do
    resources :courses, only: :create
  end

  resources :courses, exept: :create do
    resources :subjects, only: :create
  end

  resources :subjects, except: :create
end
