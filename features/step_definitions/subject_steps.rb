Then('the subject has been created') do
  expect(parsed_response_body[:id]).not_to be_nil
end

Given('there is a subject with ID {string}') do |id|
  @teacher ||= create(:teacher)
  @course ||= create(:course)
  @subject = create(:subject, id: id, teacher: @teacher, course: @course)
end

Then('the subject is included in the response') do
  @subject ||= Subject.find(parsed_response_body[:id])
  expect(parsed_response_body[:id]).to eq(@subject.reload.id)
  expect(parsed_response_body[:name]).to eq(@subject.name)
end

Then('the subject name is now {string}') do |name|
  expect(parsed_response_body[:name]).to eq(name)
end

Then('there are {int} subjects in the response') do |count|
  expect(parsed_response_body.count).to eq(count)
end

Then('the subject was removed') do
  expect(Subject.find_by(id: @subject.id)).to be_nil
end

Then('the subject with ID {string} is included in the response') do |id|
  expect(parsed_response_body.map { |o| o[:id] }).to include(id)
end
