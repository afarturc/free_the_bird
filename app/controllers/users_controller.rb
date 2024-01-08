class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @chirps = Chirp.where(user: @user).order(created_at: :desc)
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :bio)
  end
end
