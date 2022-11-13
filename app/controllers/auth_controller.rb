class AuthController < ApplicationController
    def signin
        # check user
        user = User.find_by(email: auth_params[:email])
        # if have user - with shorhand syntax
        if user&.authenticate(auth_params[:password])
            token = JwtService.encode(user)
            render json: {jwt: token, email:user.email}
        else
            render json: {error: "Incorrect email or password"}, status: 422
        end
    end

    def signup
        user = User.create(auth_params )
        unless user.errors.any?
            token = JwtService.encode(user)
            render json: {jwt: token, email:user.email} , status: 201
        else
            render json: {errors: user.errors.full_messages}, status: 422
        end
    end

    private


    def auth_params
        params.require(:auth).permit(:auth, :email, :password, :password_confirmation)
    end
end
