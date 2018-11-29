class ApplicationController < ActionController::API
  LIST = [:organization, :student, :exam, :subject, :lesson, :course, :academic_calendar, :student_exam, :exam_question].freeze

  LIST.each do |object|
    define_method("load_#{object}") do
      value = object.to_s.classify.constantize.find_by(id: params["#{object}_id"]) if params["#{object}_id"]
      instance_variable_set("@#{object}", value)
    end
  end
end
