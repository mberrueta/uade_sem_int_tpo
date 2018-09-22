
Then('the exam has been created') do
  expect(parsed_response_body[:id]).not_to be_nil
end

Given('there is an exam with ID {string}') do |id|
  @exam = create(:exam, id: id)
end

Then('the exam is included in the response') do
  @exam ||= Exam.find(parsed_response_body[:id])
  expect(parsed_response_body[:id]).to eq(@exam.reload.id)
  expect(parsed_response_body[:title]).to eq(@exam.title)
end

Then('the exam title is now {string}') do |title|
  expect(parsed_response_body[:title]).to eq(title)
end

Then('there are {int} exams in the response') do |count|
  expect(parsed_response_body.count).to eq(count)
end

Then('the exam was removed') do
  expect(Exam.find_by(id: @exam.id)).to be_nil
end


