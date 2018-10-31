class AssistSerializer < AbstractSerializer
  attributes :date, :present_code

  belongs_to :student, serializer: ::StudentSerializer
  belongs_to :course, serializer: ::CourseSerializer
end