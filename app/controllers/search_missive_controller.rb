class SearchMissiveController < ApplicationController

  def index
    @missive_filter = SearchMissive::MissiveFilter.new
    @doc_type = SearchMissive::DocType.all
  end

  def search
    @missive_filter = SearchMissive::MissiveFilter.new(params[:missive_filter])
    render 'search_missive/index'
  end

end
