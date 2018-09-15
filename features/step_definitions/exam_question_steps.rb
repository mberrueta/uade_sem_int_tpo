
Then('the exam question has been created') do
  expect(parsed_response_body[:id]).not_to be_nil
end

Given('there is an exam question with ID {string}') do |id|
  @exam_question = create(:exam_question, id: id)
end

Then('the exam question is included in the response') do
  @exam_question ||= ExamQuestion.find(parsed_response_body[:id])
  expect(parsed_response_body[:id]).to eq(@exam_question.reload.id)
  expect(parsed_response_body[:question]).to eq(@exam_question.question)
  expect(parsed_response_body[:options]).to eq(@exam_question.options)
end

Then('the exam question is now {string}') do |question|
  expect(parsed_response_body[:question]).to eq(question)
end

Then('there are {int} exam_questions in the response') do |count|
  expect(parsed_response_body.count).to eq(count)
end

Then('the exam question was removed') do
  expect(ExamQuestion.find_by(id: @exam_question.id)).to be_nil
end


