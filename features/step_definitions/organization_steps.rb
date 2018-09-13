Then('the organization has been created') do
  expect(parsed_response_body[:id]).not_to be_nil
end

Given('there is an organization with ID {int}') do |id|
  @organization = create(:organization, id: id)
end

Then('the organization is included in the response') do
  @organization ||= Organization.find(parsed_response_body[:id])
  expect(parsed_response_body[:id]).to eq(@organization.reload.id)
  expect(parsed_response_body[:name]).to eq(@organization.name)
  expect(parsed_response_body[:phone]).to eq(@organization.phone)
  expect(parsed_response_body[:address]).to eq(@organization.address)
end

Then('the organization name is now {string}') do |name|
  expect(parsed_response_body[:name]).to eq(name)
end

Then('there are {int} organizations in the response') do |count|
  expect(parsed_response_body.count).to eq(count)
end

Then('the organization was removed') do
  expect(Organization.find_by(id: @organization.id)).to be_nil
end
