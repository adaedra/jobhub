# frozen_string_literal: true

class OpeningsController < ApplicationController
  def index
    @openings = Opening.published

    respond_to do |format|
      format.html { render :spa, locals: { context: { openings: render_json } } }
      format.json {}
    end
  end

  def show
    @opening = Opening.published.find(params.require(:id))

    respond_to do |format|
      format.html do
        render :spa, locals: { context: { opening: render_json } }
      end
      format.json
    end
  end

  private

  def render_json
    # FIXME: Rendering JSON to parse it back is ugly, but I haven't found a good way to invoke jbuilder directly yet.
    JSON.parse render_to_string(formats: %i[json])
  end
end
