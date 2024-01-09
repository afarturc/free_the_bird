class RechirpsController < ApplicationController
  include ActionView::RecordIdentifier

  def index
    @user = User.find(params[:user_id])
    @chirps = @user.rechirps.map { |rechirp| rechirp.chirp }
  end

  def create
    @rechirp = Rechirp.find_or_create_by(user_id: params[:user_id], chirp_id: params[:chirp_id])
    rechirp_with_turbo
  end

  def destroy
    @rechirp = Rechirp.find_by(id: params[:id])
    @chirp = @rechirp.chirp
    @rechirp.destroy
    rechirp_with_turbo
  end

  private

  def rechirp_with_turbo
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace(dom_id(@rechirp.chirp, :rechirp), partial: "chirps/rechirp_button", locals: { chirp: @rechirp.chirp }) }
    end
  end
end
