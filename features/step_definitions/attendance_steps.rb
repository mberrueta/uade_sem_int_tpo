Then('the attendance has been created') do
  expect(parsed_response_body[:id]).not_to be_nil
end

Given('there is an attendance with ID {string}') do |id|
  step("there is an attendance with ID '#{id}' in the date '#{Faker::Date.forward}'")
end

Given('there is an attendance with ID {string} in the date {string}') do |id, date|
  @student ||= create(:student)
  @course ||= create(:course)
  @attendance = create(:attendance, id: id, course: @course, student: @student, date: date)
end

Then('the attendance is included in the response') do
  @attendance ||= Attendance.find(parsed_response_body[:id])
  expect(parsed_response_body[:id]).to eq(@attendance.reload.id)
  expect(parsed_response_body[:student][:id]).to eq(@attendance.student_id)
  expect(parsed_response_body[:present_code]).to eq(@attendance.present_code)
  expect(parsed_response_body[:date]).to eq(@attendance.date&.strftime('%Y-%m-%d'))
  expect(parsed_response_body[:course][:id]).to eq(@attendance.course_id)
end

Then('the attendance present_code is now {string}') do |present_code|
  expect(parsed_response_body[:present_code]).to eq(present_code)
end

Then('there are {int} attendances in the response') do |count|
  expect(parsed_response_body.count).to eq(count)
end

Then('the attendance was removed') do
  expect(Attendance.find_by(id: @attendance.id)).to be_nil
end


