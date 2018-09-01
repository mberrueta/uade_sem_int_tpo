When(/^I request ([^ ]+) ([^ ]+) with the payload:$/) do |method, uri, payload|
  headers = {}
  headers['HTTP_ACCEPT'] = @accept_header || 'application/json'
  headers['CONTENT_TYPE'] = @content_type || 'application/json'
  headers.merge!(Hash[@user_auth_headers.map { |key, value| ["HTTP_#{key}".upcase.sub('-', '_'), value] }]) if @user_auth_headers
  send method.downcase, uri, payload, headers
end

When(/^the mail service request ([^ ]+) ([^ ]+) with the payload:$/) do |method, uri, payload|
  headers = {}
  headers['HTTP_ACCEPT'] = @accept_header || 'application/json'
  headers['CONTENT_TYPE'] = @content_type || 'application/json'
  send method.downcase, uri, payload, headers
end

Then(/^I get a (\d+) response$/) do |code|
  step 'print the response' unless last_response.status == code.to_i
  expect(last_response.status).to eq(code.to_i)
end

When(/^I request ([^ ]+) ([^ ]+)$/) do |method, uri|
  step "I request #{method} #{uri} with the payload:", '{}'
end

Then(/^the response error (?:matches|is like) "([^"]*)"$/) do |string|
  body = parsed_response_body
  pattern = /#{string}/i

  if body.key?('errors')
    expect(body['errors'].any? { |error| error =~ pattern }).to be(true), "expected one of #{body['errors']} to match #{pattern.inspect}"
  else
    scenario.fail! 'Expected an error in the response but none was found'
  end
end

# Useful for debugging:
#
# ```
# Then I get a 422 response
# And print the response
# ```
Then(/^(pretty)? ?print the response$/) do |pretty|
  if pretty
    print JSON.pretty_generate(parsed_response_body)
  else
    pp last_response.body
  end
end

Then(/^print the query$/) do
  query = Rack::Utils.parse_nested_query last_request.query_string
  pp query['query']
end
