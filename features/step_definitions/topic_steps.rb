Then('the topic has been created') do
  expect(parsed_response_body[:id]).not_to be_nil
end

Given('there is a topic with ID {string}') do |id|
  @program ||= create(:program)
  @topic = create(:topic, id: id, program: @program)
end

Then('the topic is included in the response') do
  @topic ||= Topic.find(parsed_response_body[:id])
  expect(parsed_response_body[:id]).to eq(@topic.reload.id)
  expect(parsed_response_body[:title]).to eq(@topic.title)
end

Then('the topic title is now {string}') do |title|
  expect(parsed_response_body[:title]).to eq(title)
end

Then('there are {int} topics in the response') do |count|
  expect(parsed_response_body.count).to eq(count)
end

Then('the topic was removed') do
  expect(Topic.find_by(id: @topic.id)).to be_nil
end
