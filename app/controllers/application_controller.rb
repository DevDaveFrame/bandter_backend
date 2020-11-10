class ApplicationController < ActionController::API
  before_action :logged_in? 
  
  def encode_token(payload)
    JWT.encode(payload, ENV["JWT_SECRET"], "HS256")
  end

  def logged_in?
    headers = request.headers["Authorization"]
    token = headers.split(" ")[1]

    begin
      user_id = JWT.decode(token, ENV["JWT_SECRET"], "HS256")[0]["user_id"]
      user = User.find(user_id)
    rescue
      user = nil
    end

    render json: {error: "Please Log In"} unless user
  end
end
