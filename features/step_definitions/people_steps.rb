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

Then('the manager courses are included in the response') do
  expect(parsed_response_body[:courses]).not_to be_nil
  parsed_response_body[:courses].each do |course|
    expect(course[:classroom]).not_to be_nil
    expect(course[:shift]).not_to be_nil
    expect(course[:subjects_count]).to be >= 0
    expect(course[:students_count]).to be >= 0
  end
end

Then('the manager first course response students count is {int}') do |count|
  expect(parsed_response_body[:courses].first[:students_count]).to eq(count)
end

Then('the manager first course response subjects count is {int}') do |count|
  expect(parsed_response_body[:courses].first[:subjects_count]).to eq(count)
end

Then('the student course is included in the response') do
  expect(parsed_response_body[:course]).not_to be_nil
end

Then('the student qualification report is included in the response') do
  expect(parsed_response_body[:qualification_report]).not_to be_nil
  expect(parsed_response_body[:qualification_report][:qualification_report_subjects]).not_to be_nil
end

Then('the preceptor courses are included in the response') do
  step('the manager courses are included in the response')
end

Then('the preceptor first course response students count is {int}') do |count|
  step("the manager first course response students count is #{count}")
end

Then('the preceptor first course response subjects count is {int}') do |count|
  step("the manager first course response subjects count is #{count}")
end
