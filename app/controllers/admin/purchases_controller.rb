class Admin::PurchasesController < ApplicationController

	# アドミンユーザ以外のアクセスを防ぐ
	skip_before_action :authenticate_user!
	before_action :authenticate_admin!

    def index
    	@purchases = Purchase.all
    end

    def update
    end

end
