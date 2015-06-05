module AuthHelper
  def admin_login
    user = "test"
    password = "test"
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user,password)
  end
end
