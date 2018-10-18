
Then('the student_exam_qualification has been created') do
  expect(parsed_response_body[:id]).not_to be_nil
end

Given('there is a student_exam_qualification with ID {string}') do |id|
  @student_exam_qualification = create(:student_exam_qualification, id: id)
end

Then('the student_exam_qualification is included in the response') do
  @student_exam_qualification ||= StudentExamQualification.find(parsed_response_body[:id])
  expect(parsed_response_body[:id]).to eq(@student_exam_qualification.reload.id)
  expect(parsed_response_body[:name]).to eq(@student_exam_qualification.name)
end

Then('the student_exam_qualification name is now {string}') do |name|
  expect(parsed_response_body[:name]).to eq(name)
end

Then('there are {int} student_exam_qualifications in the response') do |count|
  expect(parsed_response_body.count).to eq(count)
end

Then('the student_exam_qualification was removed') do
  expect(StudentExamQualification.find_by(id: @student_exam_qualification.id)).to be_nil
end


