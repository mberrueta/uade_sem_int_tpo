Rails.application.routes.draw do
  resources :organizations do
    resources :academic_calendars, path: 'academic-calendars', only: :create
    resources :students, only: :create
    resources :teachers, only: :create
    resources :managers, only: :create
    resources :managers, path: :preceptors, only: :create
  end

  resources :students, exept: :create do
    resources :parents, only: :create
    resources :student_exams, path: 'student-exams', only: [:create, :index]
    resources :attendances, only: :index
    resources :exams, only: :index
  end

  resources :parents, exept: :create

  resources :teachers, exept: :create do
    resources :subjects, only: :index
    resources :lessons, only: :index
  end

  resources :managers, exept: :create do
    resources :courses, only: :index
  end

  resources :managers, path: :preceptors, exept: :create do
    resources :courses, only: :index
  end

  resources :academic_calendars, path: 'academic-calendars', except: :create do
    resources :courses, only: :create
  end

  resources :courses, exept: :create do
    resources :subjects, only: [:create, :index]
    resources :attendances, only: :index, only: [:create, :index]
  end

  resources :subjects, except: :create do
    resources :lessons, only: [:create, :index]
  end

  resources :lessons, except: :create do
    resources :topics, only: :create
    resources :exams, only: [:create, :index]
    resources :student_exams, path: 'student-exams', only: :index
  end

  resources :topics, except: :create

  resources :attendances, except: :create

  resources :exams, except: :create do
    resources :exam_questions, path: 'exam-questions', only: [:create, :index]
  end

  resources :exam_questions, path: 'exam-questions', except: :create

  resources :student_exams, path: 'student-exams', except: :create do
    resources :student_answers, path: 'student-answers', only: [:create, :index]
  end

  resources :student_answers, path: 'student-answers', except: :create
end
