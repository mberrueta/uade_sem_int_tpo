Then('the assist has been created') do
  expect(parsed_response_body[:id]).not_to be_nil
end

Given('there is an assist with ID {string}') do |id|
  step("there is an assist with ID '#{id}' in the date '#{Faker::Date.forward}'")
end

Given('there is an assist with ID {string} in the date {string}') do |id, date|
  @student ||= create(:student)
  @course ||= create(:course)
  @assist = create(:assist, id: id, course: @course, student: @student, date: date)
end

Then('the assist is included in the response') do
  @assist ||= Assist.find(parsed_response_body[:id])
  expect(parsed_response_body[:id]).to eq(@assist.reload.id)
  expect(parsed_response_body[:student][:id]).to eq(@assist.student_id)
  expect(parsed_response_body[:present_code]).to eq(@assist.present_code)
  expect(parsed_response_body[:date]).to eq(@assist.date&.strftime('%Y-%m-%d'))
  expect(parsed_response_body[:course][:id]).to eq(@assist.course_id)
end

Then('the assist present_code is now {string}') do |present_code|
  expect(parsed_response_body[:present_code]).to eq(present_code)
end

Then('there are {int} assists in the response') do |count|
  expect(parsed_response_body.count).to eq(count)
end

Then('the assist was removed') do
  expect(Assist.find_by(id: @assist.id)).to be_nil
end


