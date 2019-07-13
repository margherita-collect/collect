class Admin::ProductsController < ApplicationController

  	# アドミンユーザ以外のアクセスを防ぐ
    skip_before_action :authenticate_user!
	before_action :authenticate_admin!

    def new
    end

    def create
    end

    def index
    end

    def show
    end

    def edit
    end

    def update
    end

end
