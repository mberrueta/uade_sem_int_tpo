Then('the feedback has been created') do
  expect(parsed_response_body[:id]).not_to be_nil
end

Given('there is a feedback with ID {string}') do |id|
  @student ||= create(:student)
  to = @exam || @lesson || @teacher || @manager || @preceptor || create(:student)
  @feedback = create(:feedback, id: id, student: @student, to: to)
end

Then('the feedback is included in the response') do
  @feedback ||= Feedback.find(parsed_response_body[:id])
  expect(parsed_response_body[:id]).to eq(@feedback.reload.id)
  expect(parsed_response_body[:value]).to eq(@feedback.value)
  expect(parsed_response_body[:comments]).to eq(@feedback.comments)
  expect(parsed_response_body[:viewed]).to eq(@feedback.viewed)
  expect(parsed_response_body[:student][:id]).to eq(@feedback.student.id) if parsed_response_body[:student]
  expect(parsed_response_body[:to][:id]).to eq(@feedback.to.id) if parsed_response_body[:to]
end

Then('the feedback value is now {string}') do |value|
  expect(parsed_response_body[:value]).to eq(value)
end

Then('there are {int} feedback in the response') do |count|
  expect(parsed_response_body.count).to eq(count)
end

Then('the feedback was removed') do
  expect(Feedback.find_by(id: @feedback.id)).to be_nil
end

Then('the feedback to_id is now {string}') do |id|
  expect(parsed_response_body[:to][:id]).to eq(id)
end

Then('the feedback value is now {int}') do |value|
  expect(parsed_response_body[:value]).to eq(value)
end

Given('the feedback was already viewed') do
  @feedback.update!(viewed: true)
end