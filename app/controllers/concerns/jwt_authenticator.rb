module JwtAuthenticator
  require "jwt"

  SECRET_KEY = Rails.application.credentials.secret_key_base

  # ヘッダーの認証トークンを復号化してユーザー認証を行う
  def jwt_authenticate
    raise UnableAuthorizationError.new("認証情報が不足しています。") if request.headers['Authorization'].blank?

    # headers['Authorization'] = "Bearer XXXXX..."
    encoded_token = request.headers['Authorization'].split('Bearer ').last
    payload = decode(encoded_token)
    # Payloadから取得したユーザーIDでログインしているユーザー情報を取得
    @current_user = User.find_by(id: payload['user_id'])
    raise UnableAuthorizationError.new("認証できません。") if @current_user.blank?
    @current_user
  end

  def encode(user_id)
    expires_in = 1.weeks.from_now.to_i
    payload = { user_id: user_id, exp: expires_in }
    JWT.encode(payload, SECRET_KEY, 'HS256')
  end

  def decode(encoded_token)
    decoded_dwt = JWT.decode(encoded_token, SECRET_KEY, true, algorithm: 'HS256')
    decoded_dwt.first
  end

end
