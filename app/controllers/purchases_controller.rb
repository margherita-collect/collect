class PurchasesController < ApplicationController
  def index
  	@purchases = current_user.purchases.all
  end
end
