class Admin::UsersController < ApplicationController

	# アドミンユーザ以外のアクセスを防ぐ
    skip_before_action :authenticate_user!
	before_action :authenticate_admin!

    def index
        @users = User.all
    end

    def show
      @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        user = User.find(params[:id])
        if user.update(user_params)
            flash[:notice] = "ユーザー情報を編集しました"
            redirect_to admin_user_path(user.id)
        else
            flash[:notice] = "ユーザー情報の編集に失敗しました"
            render :edit
        end
    end

    private
    def user_params
        params.require(:user).permit(:surname,:firstname,:kana_surname,:kana_first_name,:email,:phone_number,:zip_code,:address)
    end

end
