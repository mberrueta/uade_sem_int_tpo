
Then('the assist has been created') do
  expect(parsed_response_body[:id]).not_to be_nil
end

Given('there is an assist with ID {int}') do |id|
  @assist = create(:assist, id: id)
end

Then('the assist is included in the response') do
  @assist ||= Assist.find(parsed_response_body[:id])
  expect(parsed_response_body[:id]).to eq(@assist.reload.id)
  expect(parsed_response_body[:name]).to eq(@assist.name)
end

Then('the assist name is now {string}') do |name|
  expect(parsed_response_body[:name]).to eq(name)
end

Then('there are {int} assists in the response') do |count|
  expect(parsed_response_body.count).to eq(count)
end

Then('the assist was removed') do
  expect(Assist.find_by(id: @assist.id)).to be_nil
end


