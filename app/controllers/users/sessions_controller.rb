module Users
  class SessionsController < Devise::SessionsController
    respond_to :json

    private

    def respond_with(resource, opts = {})
      Rails.logger.debug "resource: #{resource.inspect}"
      Rails.logger.debug "opts: #{opts.inspect}"

      render json: {
        status: { code: 200, message: 'Logged in successfully.' },
        data: UserSerializer.new(resource, opts).serializable_hash[:data][:attributes],
        jwt_token: generate_jwt_token(resource)
      }, status: :ok
    end

    def respond_to_on_destroy
      Rails.logger.debug "current_user: #{current_user.inspect}"
      if current_user
        render json: {
          status: 200,
          message: 'logged out successfully'
        }, status: :ok
      else
        render json: {
          status: 401,
          message: "Couldn't find an active session."
        }, status: :unauthorized
      end
    end

    def generate_jwt_token(_resource)
      token = request.env['warden-jwt_auth.token']
      token if token.present?
    end
  end
end
