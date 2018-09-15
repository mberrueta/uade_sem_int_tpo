
Then('the news has been created') do
  expect(parsed_response_body[:id]).not_to be_nil
end

Given('there is an news with ID {int}') do |id|
  @news = create(:news, id: id)
end

Then('the news is included in the response') do
  @news ||= New.find(parsed_response_body[:id])
  expect(parsed_response_body[:id]).to eq(@news.reload.id)
  expect(parsed_response_body[:name]).to eq(@news.name)
end

Then('the news name is now {string}') do |name|
  expect(parsed_response_body[:name]).to eq(name)
end

Then('there are {int} newss in the response') do |count|
  expect(parsed_response_body.count).to eq(count)
end

Then('the news was removed') do
  expect(New.find_by(id: @news.id)).to be_nil
end


