class ExamQuestionSerializer < AbstractSerializer
  attributes :question, :options

  def options
    object.options.shuffle
  end
end