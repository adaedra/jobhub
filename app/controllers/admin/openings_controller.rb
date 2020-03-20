# frozen_string_literal: true

class Admin::OpeningsController < Admin::ApplicationController
  def index
    respond_to do |format|
      format.html {}
      format.json { @openings = Opening.all }
    end
  end
end
