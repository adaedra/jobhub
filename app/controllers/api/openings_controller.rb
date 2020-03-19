# frozen_string_literal: true

class Api::OpeningsController < Api::ApplicationController
  def create
    opening = Opening.new(opening_params)

    if opening.save(context: :api_create)
      render json: { id: opening.id }, status: :created
    else
      render json: { errors: opening.errors }, status: :unprocessable_entity
    end
  end

  private

  def opening_params
    params
      .require(:opening)
      .permit(:title, :description, :company, :upstream_url, :published_at, :archived_at)
  end
end
