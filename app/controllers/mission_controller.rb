class MissionController < ApplicationController
  def index
    @missions = Mission.all
    render json: @listing
  end
end
