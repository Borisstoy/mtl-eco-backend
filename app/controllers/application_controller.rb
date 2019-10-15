class ApplicationController < ActionController::API
    before_action :authenticate_requests
    attr_reader :current_user

    private
    
    def authenticate_requests
        @current_user = AuthorizeApiRequest.call(request.headers).result
        render json: { error: 'Not Authorized' }, status: 401 unless @current_user
    end
end
