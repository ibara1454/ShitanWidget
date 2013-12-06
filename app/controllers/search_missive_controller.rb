class SearchMissiveController < ApplicationController

  def index
    @missive_filter = MissiveFilter.new
  end

  def search
    @missive_filter = MissiveFilter.new(params[:missive_filter])
    render 'search_missive/index'
  end

end
