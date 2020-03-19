# frozen_string_literal: true

class Api::OpeningsController < Api::ApplicationController
  def create
    render json: { success: 'maybe' }
  end
end
