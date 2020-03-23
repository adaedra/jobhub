# frozen_string_literal: true

class Admin::OpeningsController < Admin::ApplicationController
  def index
    respond_to do |format|
      format.html {}
      format.json { @openings = Opening.all }
    end
  end

  def show
    respond_to do |format|
      format.html {}
      format.json { @opening = Opening.find(params.require(:id)) }
    end
  end
end
