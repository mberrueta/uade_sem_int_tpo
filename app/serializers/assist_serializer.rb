class AssistSerializer < AbstractSerializer
  attributes :date, :present_code

  belongs_to :student, serializer: ::StudentSerializer
end