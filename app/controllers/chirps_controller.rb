class ChirpsController < ApplicationController
  def index
    @chirps = Chirp.all
  end

  def show
    @chirp = Chirp.find_by(id: params[:id])
  end

  def create
    @chirp = Chirp.new(chirp_params.merge(user: current_user))

    if @chirp.save
      redirect_to user_chirp_path(user_id: current_user.id, id: @chirp.id)
    else
      render :index
    end
  end

  private

  def chirp_params
    params.require(:chirp).permit(:body)
  end
end
