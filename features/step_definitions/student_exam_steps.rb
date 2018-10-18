
Then('the student exam has been created') do
  expect(parsed_response_body[:id]).not_to be_nil
end

Given('there is a student exam with ID {string}') do |id|
  @student ||= create(:student)
  @exam ||= create(:exam)
  @student_exam = create(:student_exam, id: id, exam: @exam, student: @student)
end

Then('the student exam is included in the response') do
  @student_exam ||= StudentExam.find(parsed_response_body[:id])
  expect(parsed_response_body[:id]).to eq(@student_exam.reload.id)
end

Then('the student exam name is now {string}') do |name|
  expect(parsed_response_body[:name]).to eq(name)
end

Then('there are {int} student exams in the response') do |count|
  expect(parsed_response_body.count).to eq(count)
end

Then('the student exam was removed') do
  expect(StudentExam.find_by(id: @student_exam.id)).to be_nil
end

Then('the student exam with ID {string} is included in the response') do |id|
  expect(parsed_response_body.map { |o| o[:id] }).to include(id)
end
