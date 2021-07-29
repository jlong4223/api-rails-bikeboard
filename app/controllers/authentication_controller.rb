class AuthenticationController < ApplicationController
    def create
        # finding user by email
        user = User.find_by(email: params[:email])
        
        if user && user.authenticate(params[:password])
        # encoding the token with id, name, email, role, details_id
         auth_token = JsonWebToken.encode(
                {
                    user_id: user.id, 
                    name: user.name, 
                    email: user.email,
                    role: user.role,
                    details_id: user.details[0].id
                }
            )
            
         render json: {auth_token: auth_token}, status: :ok
       else
         render json: {error: 'Login Unsuccessful'}, status: :unauthorized
       end
    end
  end