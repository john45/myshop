class SearchSeggestionsController < ApplicationController
  def index
    render json: SearchSeggestion.term_for(params[:term])
  end
end
