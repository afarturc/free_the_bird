class LikesController < ApplicationController
  include ActionView::RecordIdentifier

  def create
    @like = Like.find_or_create_by(user_id: params[:user_id], chirp_id: params[:chirp_id])

    respond_to do |format|
      format.turbo_stream { render turbo_stream: [
        turbo_stream.replace(dom_id(@like.chirp, :like), partial: "chirps/like_button", locals: { chirp: @like.chirp }),
        turbo_stream.replace(dom_id(@like.chirp, :likes_count), partial: "chirps/likes_counter", locals: { chirp: @like.chirp })
      ].join }
    end
  end

  def destroy
    @like = Like.find_by(id: params[:id])

    chirp = @like.chirp

    @like.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: [
        turbo_stream.replace(dom_id(chirp, :like), partial: "chirps/like_button", locals: { chirp: chirp }),
        turbo_stream.replace(dom_id(chirp, :likes_count), partial: "chirps/likes_counter", locals: { chirp: chirp })
      ].join }
    end
  end
end
