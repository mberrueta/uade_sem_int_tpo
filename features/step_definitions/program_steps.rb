
Then('the program has been created') do
  expect(parsed_response_body[:id]).not_to be_nil
end

Given('there is a program with ID {string}') do |id|
  @subject ||= create(:subject)
  @program = create(:program, id: id, subject: @subject)
end

Then('the program is included in the response') do
  @program ||= Program.find(parsed_response_body[:id])
  expect(parsed_response_body[:id]).to eq(@program.reload.id)
  expect(parsed_response_body[:day]).to eq(@program.day.strftime('%Y-%m-%d'))
  expect(parsed_response_body[:class_number]).to eq(@program.class_number)
  expect(parsed_response_body[:subject][:id]).to eq(@program.subject.id) if parsed_response_body[:subject]
end

Then('the program name is now {string}') do |name|
  expect(parsed_response_body[:name]).to eq(name)
end

Then('there are {int} programs in the response') do |count|
  expect(parsed_response_body.count).to eq(count)
end

Then('the program was removed') do
  expect(Program.find_by(id: @program.id)).to be_nil
end

Then('the program day is now {string}') do |date|
  expect(parsed_response_body[:day]).to eq(date)
end
