
Then('the {string} has been created') do |_type|
  expect(parsed_response_body[:id]).not_to be_nil
end

Given('there is a {string} with ID {string}') do |type, id|
  instance_variable_set("@#{type}", create(type, id: id))
end

Then('the {string} is included in the response') do |_type|
  @person ||= Person.find(parsed_response_body[:id])
  expect(parsed_response_body[:id]).to eq(@person.reload.id)
  expect(parsed_response_body[:first_name]).to eq(@person.first_name)
  expect(parsed_response_body[:last_name]).to eq(@person.last_name)
  expect(parsed_response_body[:phone]).to eq(@person.phone)
  expect(parsed_response_body[:address]).to eq(@person.address)
  expect(parsed_response_body[:email]).to eq(@person.email)
  expect(parsed_response_body[:gender]).to eq(@person.gender)
end

Then('the {string} first name is now {string}') do |_type, first_name|
  expect(parsed_response_body[:first_name]).to eq(first_name)
end

Then('there are {int} {string} in the response') do |count, _type|
  expect(parsed_response_body.count).to eq(count)
end

Then('the {string} was removed') do |type|
  expect(Person.find_by(id: instance_variable_get("@#{type}").id)).to be_nil
end


