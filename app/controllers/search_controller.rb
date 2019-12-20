class SearchController < ApplicationController
  def index
    @station = Station.new(params[:location])
  end
end
