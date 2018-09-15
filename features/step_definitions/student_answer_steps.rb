
Then('the student_answer has been created') do
  expect(parsed_response_body[:id]).not_to be_nil
end

Given('there is a student_answer with ID {int}') do |id|
  @student_answer = create(:student_answer, id: id)
end

Then('the student_answer is included in the response') do
  @student_answer ||= StudentAnswer.find(parsed_response_body[:id])
  expect(parsed_response_body[:id]).to eq(@student_answer.reload.id)
  expect(parsed_response_body[:name]).to eq(@student_answer.name)
end

Then('the student_answer name is now {string}') do |name|
  expect(parsed_response_body[:name]).to eq(name)
end

Then('there are {int} student_answers in the response') do |count|
  expect(parsed_response_body.count).to eq(count)
end

Then('the student_answer was removed') do
  expect(StudentAnswer.find_by(id: @student_answer.id)).to be_nil
end


