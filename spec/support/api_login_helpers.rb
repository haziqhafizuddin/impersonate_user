module ApiLoginHelpers
  def authenticated_header(user)
    {
      'Content-Type': 'application/json',
      'Authorization': "Bearer #{jwt_token(user)}"
    }
  end

  def jwt_token(user)
    Knock::AuthToken.new(
      payload: { sub: user.id }
    ).token
  end
end
