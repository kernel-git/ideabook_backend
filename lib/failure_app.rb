class FailureApp < Devise::FailureApp
  def respond
    json_unauthorized
  end

  private

  def json_unauthorized
    self.status = :unauthorized
    self.content_type = 'application/json'
    self.response_body = { errors: [{ status: '401', message: i18n_message }]}.to_json
  end
end
