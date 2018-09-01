module HttpHelpers
  def parsed_response_body
    @parsed_response_body ||= {}
    hash = last_response.hash

    unless @parsed_response_body[hash]
      parsed = JSON.parse(last_response.body)
      parsed = convert_to_hash(parsed)
      @parsed_response_body[hash] = parsed
    end

    @parsed_response_body[hash]
  end

  def parsed_request_body
    @parsed_request_body ||= {}
    @parsed_request_body[last_request.hash] ||= last_request.params.with_indifferent_access
  end

  def parsed_model(type, namespace = nil)
    type = type.to_s.classify
    klass = namespace ? "#{namespace.to_s.classify}::#{type}" : type
    klass.to_constant.find(parsed_response_body[:id])
  end

  def create_auth_token(user, token: nil)
    token ||= ::Knock::AuthToken.new(payload: { sub: user.id }).token
    { 'AUTHORIZATION' => "Bearer #{token}" }
  end

  private

  def convert_to_hash(obj)
    return {} unless obj
    if obj.is_a?(Array)
      obj.map(&:with_indifferent_access)
    else
      obj.with_indifferent_access
    end
  end
end

World(HttpHelpers)
