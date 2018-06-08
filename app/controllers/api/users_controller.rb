module Api
  class UsersController < ApiController
    def create
      @user = User.create!(user_params)
      json_response(@user, :created)
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end
end
