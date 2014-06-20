class UsersController < ApplicationController
  skip_before_filter :authenticate, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user  = User.new(user_params)
    if @user.save
      SystemMailer.new_account(@user).deliver
      redirect_to stores_path
    else
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit!
    end
end
