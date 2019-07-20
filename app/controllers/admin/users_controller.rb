class Admin::UsersController < ApplicationController

	# アドミンユーザ以外のアクセスを防ぐ
    skip_before_action :authenticate_user!
	before_action :authenticate_admin!

    def index
        @users = User.all
    end

    def show
    end

    def edit
    end

    def update
    end

end
