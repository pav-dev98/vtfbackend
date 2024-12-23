class ApplicationController < ActionController::API
    before_action :authenticate_request
    attr_reader :current_user

    private

    def authenticate_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    decoded = JsonWebToken.decode(header)
    
    if decoded
      @current_user = User.find(decoded[:user_id])
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
    
    rescue ActiveRecord::RecordNotFound
    render json: { error: 'unauthorized' }, status: :unauthorized
    end
end
