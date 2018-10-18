
Then('the qualification_report has been created') do
  expect(parsed_response_body[:id]).not_to be_nil
end

Given('there is an qualification_report with ID {string}') do |id|
  @student ||= create(:student)
  @qualification_report = create(:qualification_report, id: id, student: @student)
end

Then('the qualification_report is included in the response') do
  @qualification_report ||= QualificationReport.find(parsed_response_body[:id])
  expect(parsed_response_body[:id]).to eq(@qualification_report.reload.id)
  expect(parsed_response_body[:name]).to eq(@qualification_report.name)
end

Then('the qualification_report name is now {string}') do |name|
  expect(parsed_response_body[:name]).to eq(name)
end

Then('there are {int} qualification_reports in the response') do |count|
  expect(parsed_response_body.count).to eq(count)
end

Then('the qualification_report was removed') do
  expect(QualificationReport.find_by(id: @qualification_report.id)).to be_nil
end


