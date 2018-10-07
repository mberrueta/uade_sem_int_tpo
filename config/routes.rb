Rails.application.routes.draw do
  resources :organizations do
    resources :academic_calendars, path: 'academic-calendars', only: :create
    resources :students, only: :create
  end

  resources :students, exept: :create do
    resources :parents, only: :create
  end

  resources :parents, exept: :create

  resources :academic_calendars, path: 'academic-calendars', except: :create do
    resources :courses, only: :create
  end

  resources :courses, exept: :create do
    resources :subjects, only: :create
  end

  resources :subjects, except: :create do
    resources :programs, only: :create
    resources :exams, only: :create
  end

  resources :programs, except: :create do
    resources :topics, only: :create
  end

  resources :topics, except: :create

  resources :exams, except: :create do
    resources :exam_questions, path: 'exam-questions', only: :create
  end

  resources :exam_questions, path: 'exam-questions', except: :create
end
