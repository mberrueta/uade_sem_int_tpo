class CourseSerializer < AbstractSerializer
  attributes :name, :classroom, :shift, :subjects_count, :students_count, :max_students
end