class ChirpsController < ApplicationController
  def index
    @chirps = Chirp.order(created_at: :desc)
  end

  def show
    @chirp = Chirp.find_by(id: params[:id])
  end

  def create
    @chirp = Chirp.new(chirp_params.merge(user: current_user))

    if @chirp.save
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.prepend("feed", partial: "chirp_card", locals: { chirp: @chirp }) }
      end
    else
      render :index
    end
  end

  private

  def chirp_params
    params.require(:chirp).permit(:body)
  end
end
