
Then('the exam has been created') do
  expect(parsed_response_body[:id]).not_to be_nil
end

Given('there is an exam with ID {string}') do |id|
  @exam = create(:exam, id: id)
end

Then('the exam is included in the response') do
  @exam ||= Exam.find(parsed_response_body[:id])
  expect(parsed_response_body[:id]).to eq(@exam.reload.id)
  expect(parsed_response_body[:title]).to eq(@exam.title)
  expect(parsed_response_body[:lesson][:id]).to eq(@exam.lesson_id) if @exam.lesson
end

Then('the exam title is now {string}') do |title|
  expect(parsed_response_body[:title]).to eq(title)
end

Then('there are {int} exams in the response') do |count|
  expect(parsed_response_body.count).to eq(count)
end

Then('the exam was removed') do
  expect(Exam.find_by(id: @exam.id)).to be_nil
end

Given('the student has pending the exam for the lesson with ID {string}') do |id|
  @lesson = Lesson.find(id)
  create_list(:exam_question, 3, exam: @lesson.exam)
  @student_exam = create(:student_exam, student: @student, exam: @lesson.exam)
end

Given('the student has made the exam for the lesson with ID {string}') do |id|
  step("the student has pending the exam for the lesson with ID '#{id}'")

  @lesson.exam_questions.each do |exam_question|
    @student_exam.student_answers << create(:student_answer, exam_question: exam_question, student_exam: @student_exam)
  end
end

Given('the exam has a question with ID {string} and options are:') do |id, table|
  create(:exam_question, id: id, exam: @exam, options: table.rows.flatten)
end

Given('the exam has {int} questions') do |count|
  create_list(:exam_question, count, exam: @exam)
end