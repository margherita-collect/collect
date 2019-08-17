class UsersController < ApplicationController

  def show
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
    @user = User.find(params[:id])
  end

  def edit
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

        if  @user.update(user_params)
            flash[:notice] = "ユーザー情報を編集しました"
            redirect_to user_path(@user.id)
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

 