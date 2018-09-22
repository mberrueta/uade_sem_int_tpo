
Then('the qualification_report_subject has been created') do
  expect(parsed_response_body[:id]).not_to be_nil
end

Given('there is an qualification_report_subject with ID {int}') do |id|
  @qualification_report_subject = create(:qualification_report_subject, id: id)
end

Then('the qualification_report_subject is included in the response') do
  @qualification_report_subject ||= QualificatioReportSubject.find(parsed_response_body[:id])
  expect(parsed_response_body[:id]).to eq(@qualification_report_subject.reload.id)
  expect(parsed_response_body[:name]).to eq(@qualification_report_subject.name)
end

Then('the qualification_report_subject name is now {string}') do |name|
  expect(parsed_response_body[:name]).to eq(name)
end

Then('there are {int} qualification_report_subjects in the response') do |count|
  expect(parsed_response_body.count).to eq(count)
end

Then('the qualification_report_subject was removed') do
  expect(QualificatioReportSubject.find_by(id: @qualification_report_subject.id)).to be_nil
end


