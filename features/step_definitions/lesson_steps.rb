
Then('the lesson has been created') do
  expect(parsed_response_body[:id]).not_to be_nil
end

Given('there is a lesson with ID {string}') do |id|
  @teacher ||= create(:teacher)
  @subject ||= create(:subject, teacher: @teacher)
  @lesson = create(:lesson, id: id, subject: @subject)
end

Then('the lesson is included in the response') do
  @lesson ||= Lesson.find(parsed_response_body[:id])
  expect(parsed_response_body[:id]).to eq(@lesson.reload.id)
  expect(parsed_response_body[:date]).to eq(@lesson.date.strftime('%Y-%m-%d'))
  expect(parsed_response_body[:class_number]).to eq(@lesson.class_number)
  expect(parsed_response_body[:subject][:id]).to eq(@lesson.subject.id) if parsed_response_body[:subject]
  expect(parsed_response_body[:teacher][:id]).to eq(@lesson.subject.teacher.id) if parsed_response_body[:teacher]
  expect(parsed_response_body[:exam][:id]).to eq(@lesson.exam.id) if parsed_response_body[:exam]
end

Then('the lesson name is now {string}') do |name|
  expect(parsed_response_body[:name]).to eq(name)
end

Then('there are {int} lessons in the response') do |count|
  expect(parsed_response_body.count).to eq(count)
end

Then('the lesson was removed') do
  expect(Lesson.find_by(id: @lesson.id)).to be_nil
end

Then('the lesson date is now {string}') do |date|
  expect(parsed_response_body[:date]).to eq(date)
end

Then('the lesson teacher_id is now {string}') do |id|
  expect(parsed_response_body[:teacher][:id]).to eq(id)
end
