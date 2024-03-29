class ChirpsController < ApplicationController
  include ActionView::RecordIdentifier

  def index
    @chirps = Chirp.order(created_at: :desc)
  end

  def show
    @chirp = Chirp.find(params[:id])
    @replies = Chirp.find(params[:id]).reply_chirps.order(created_at: :desc)
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

  def reply
    parent_chirp = Chirp.find(params[:chirp_id])
    @chirp = Chirp.create(chirp_params.merge(user: current_user, parent_chirp: parent_chirp))

    if @chirp.save
      respond_to do |format|
        format.turbo_stream { render turbo_stream: [
          turbo_stream.prepend("replies", partial: "chirp_card", locals: { chirp: @chirp }),
          turbo_stream.replace(dom_id(parent_chirp, :replies_count), partial: "replies_count", locals: { chirp: parent_chirp })
        ]}
      end
    else
      render :show
    end
  end

  def destroy
    @chirp = Chirp.find(params[:id])

    chirp = @chirp

    if @chirp.destroy
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.remove(dom_id(chirp)) }
      end
    end
  end

  private

  def chirp_params
    params.require(:chirp).permit(:body)
  end
end
