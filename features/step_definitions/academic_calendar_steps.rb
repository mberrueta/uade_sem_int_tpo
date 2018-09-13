Then('the academic calendar has been created') do
  expect(parsed_response_body[:id]).not_to be_nil
end

Given('there is an academic calendar with ID {int}') do |id|
  @academic_calendar = create(:academic_calendar, id: id)
end

Then('the academic calendar is included in the response') do
  @academic_calendar ||= AcademicCalendar.find(parsed_response_body[:id])
  expect(parsed_response_body[:id]).to eq(@academic_calendar.reload.id)
  expect(parsed_response_body[:year]).to eq(@academic_calendar.year)
  expect(parsed_response_body[:calendar_type]).to eq(@academic_calendar.calendar_type)
end

Then('the academic calendar year is now {int}') do |year|
  expect(parsed_response_body[:year]).to eq(year)
end

Then('there are {int} academic calendars in the response') do |count|
  expect(parsed_response_body.count).to eq(count)
end

Then('the academic calendar was removed') do
  expect(AcademicCalendar.find_by(id: @academic_calendar.id)).to be_nil
end
