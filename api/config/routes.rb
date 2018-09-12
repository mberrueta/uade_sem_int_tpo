Rails.application.routes.draw do
  resources :organizations do
    resources :academic_calendars, path: 'academic-calendars', only: :create
  end

  resources :academic_calendars, path: 'academic-calendars', except: :create
end
