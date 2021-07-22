class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]


    def index
        @users = User.all
        render json: @users.to_json(include: :details, except: [:password_digest])
    end

    def show
        render json: @user.as_json(include: :details, except: [:password_digest])
    end

    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user, status: :created, location: @user
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end


    def update
        if @user.update(user_params)
            render json: @user.as_json(include: :details, except: [:password_digest])
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @user.destroy
        
        if @user.destroy
            render json: { 
                status: "user #{@user.id} deleted",
                name: "#{@user.name} no longer is in the system"
            }
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :email, :password, :role, :avatar_url, :bio, :website, :location)
    end
end