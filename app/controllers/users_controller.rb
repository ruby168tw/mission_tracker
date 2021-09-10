class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
          flash[:success] = "註冊成功"
          session[:user_id] = @user.id
          @missions = Mission.find_by(id: @user.id)
          redirect_to missions_path
        else
          flash[:error] = "註冊失敗"
          render 'new'
        end
    end
    

    private
    def user_params
        params.require(:user).permit(:email, :password, :nickname)
    end
end
