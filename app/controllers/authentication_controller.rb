class AuthenticationController < ApplicationController
    def create
        # finding user by email
        user = User.find_by(email: params[:email])
        
        # puts "user has details: #{user.details[0] ? true : false}"

        # TODO watch this to see what happens when a user does add details

        if user && user.authenticate(params[:password])
        # encoding the token with id, name, email, role, details_id
         auth_token = JsonWebToken.encode(
                {
                    user_id: user.id, 
                    name: user.name, 
                    email: user.email,
                    role: user.role,
                    details_id: user.details[0] ? user.details[0].id : nil
                }
            )
            
         render json: {auth_token: auth_token}, status: :ok
       else
         render json: {error: 'Login Unsuccessful'}, status: :unauthorized
       end
    end
  end