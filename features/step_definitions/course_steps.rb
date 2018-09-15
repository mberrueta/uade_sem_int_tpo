Then('the course has been created') do
  expect(parsed_response_body[:id]).not_to be_nil
end

Given('there is an course with ID {string}') do |id|
  @course = create(:course, id: id)
end

Then('the course is included in the response') do
  @course ||= Course.find(parsed_response_body[:id])
  expect(parsed_response_body[:id]).to eq(@course.reload.id)
  expect(parsed_response_body[:name]).to eq(@course.name)
  expect(parsed_response_body[:max_students]).to eq(@course.max_students)
end

Then('the course name is now {string}') do |name|
  expect(parsed_response_body[:name]).to eq(name)
end

Then('there are {int} courses in the response') do |count|
  expect(parsed_response_body.count).to eq(count)
end

Then('the course was removed') do
  expect(Course.find_by(id: @course.id)).to be_nil
end
