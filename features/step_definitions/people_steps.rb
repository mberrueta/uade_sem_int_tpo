
Then('the student has been created') do
  expect(parsed_response_body[:id]).not_to be_nil
end

Given('there is a student with ID {string}') do |id|
  @student = create(:student, id: id)
end

Then('the student is included in the response') do
  @student ||= Student.find(parsed_response_body[:id])
  expect(parsed_response_body[:id]).to eq(@student.reload.id)
  expect(parsed_response_body[:first_name]).to eq(@student.first_name)
  expect(parsed_response_body[:last_name]).to eq(@student.last_name)
  expect(parsed_response_body[:phone]).to eq(@student.phone)
  expect(parsed_response_body[:address]).to eq(@student.address)
  expect(parsed_response_body[:email]).to eq(@student.email)
  expect(parsed_response_body[:gender]).to eq(@student.gender)
end

Then('the student first name is now {string}') do |first_name|
  expect(parsed_response_body[:first_name]).to eq(first_name)
end

Then('there are {int} students in the response') do |count|
  expect(parsed_response_body.count).to eq(count)
end

Then('the student was removed') do
  expect(Student.find_by(id: @student.id)).to be_nil
end


