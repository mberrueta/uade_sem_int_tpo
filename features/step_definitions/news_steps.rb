
Then('the new has been created') do
  expect(parsed_response_body[:id]).not_to be_nil
end

Given('there is an new with ID {string}') do |id|
  @new = create(:new, id: id)
end

Then('the new is included in the response') do
  @new ||= New.find(parsed_response_body[:id])
  expect(parsed_response_body[:id]).to eq(@new.reload.id)
  expect(parsed_response_body[:name]).to eq(@new.name)
end

Then('the new name is now {string}') do |name|
  expect(parsed_response_body[:name]).to eq(name)
end

Then('there are {int} news in the response') do |count|
  expect(parsed_response_body.count).to eq(count)
end

Then('the new was removed') do
  expect(New.find_by(id: @new.id)).to be_nil
end


