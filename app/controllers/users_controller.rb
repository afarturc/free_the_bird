class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @chirps = Chirp.where(user: @user).order(created_at: :desc)
  end
end
