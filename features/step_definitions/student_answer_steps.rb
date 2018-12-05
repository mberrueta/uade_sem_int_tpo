Then('the student answer has been created') do
  expect(parsed_response_body[:id]).not_to be_nil
end

Given('there is an incorrect student answer with ID {string}') do |id|
  @student_exam ||= create(:student_exam)
  @exam_question ||= create(:exam_question)
  @student_answer = create(:student_answer, id: id, student_exam: @student_exam, exam_question: @exam_question, answer: "I don't remember")
end

Given('there is a correct student answer with ID {string}') do |id|
  @student_exam ||= create(:student_exam)
  @exam_question ||= create(:exam_question)
  @student_answer = create(:student_answer, id: id, student_exam: @student_exam, exam_question: @exam_question, answer: @exam_question.options.first)
end

Then('the student answer is included in the response') do
  @student_answer ||= StudentAnswer.find(parsed_response_body[:id])
  expect(parsed_response_body[:id]).to eq(@student_answer.reload.id)
  expect(parsed_response_body[:answer]).to eq(@student_answer.answer)
end

Then('the student answer is now {string}') do |answer|
  expect(parsed_response_body[:answer]).to eq(answer)
end

Then('there are {int} student answers in the response') do |count|
  expect(parsed_response_body.count).to eq(count)
end

Then('the student answer was removed') do
  expect(StudentAnswer.find_by(id: @student_answer.id)).to be_nil
end

Then(/^the student answer is (correct|incorrect)$/) do |type|
  result = type == 'correct'
  expect(parsed_response_body[:correct]).to eq(result)
end

Then('the student answer with ID {string} is included in the response') do |id|
  expect(parsed_response_body.map { |o| o[:id] }).to include(id)
end
