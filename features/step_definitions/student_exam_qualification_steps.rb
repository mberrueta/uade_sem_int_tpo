Given('there is a student exam qualification with ID {string}') do |id|
  @student_exam_qualification = create(:student_exam_qualification, id: id)
end

Then('the student exam qualification is included in the response') do
  @student_exam_qualification ||= StudentExamQualification.find(parsed_response_body[:id])
  expect(parsed_response_body[:id]).to eq(@student_exam_qualification.reload.id)
  expect(parsed_response_body[:score]).to eq(@student_exam_qualification.score)
  expect(parsed_response_body[:result]).to eq(@student_exam_qualification.result)
  expect(parsed_response_body[:notes]).to eq(@student_exam_qualification.notes)
end

Then('the student exam qualification name is now {string}') do |name|
  expect(parsed_response_body[:name]).to eq(name)
end
