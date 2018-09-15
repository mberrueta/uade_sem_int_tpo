
Then('the student_exam has been created') do
  expect(parsed_response_body[:id]).not_to be_nil
end

Given('there is a student_exam with ID {int}') do |id|
  @student_exam = create(:student_exam, id: id)
end

Then('the student_exam is included in the response') do
  @student_exam ||= StudentExam.find(parsed_response_body[:id])
  expect(parsed_response_body[:id]).to eq(@student_exam.reload.id)
  expect(parsed_response_body[:name]).to eq(@student_exam.name)
end

Then('the student_exam name is now {string}') do |name|
  expect(parsed_response_body[:name]).to eq(name)
end

Then('there are {int} student_exams in the response') do |count|
  expect(parsed_response_body.count).to eq(count)
end

Then('the student_exam was removed') do
  expect(StudentExam.find_by(id: @student_exam.id)).to be_nil
end


