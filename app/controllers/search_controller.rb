class SearchController < ApplicationController
  def index
    if params[:query].present?
      @chirps = Chirp.search("body", params[:query])
    else
      @users = User.all
    end

    if turbo_frame_request?
      render partial: "shared/chirps", locals: { chirps: @chirps }
    else
      render :index
    end
  end
end
