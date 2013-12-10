class SearchMissiveController < ApplicationController

  def index
    @missive_filter = SearchMissive::MissiveFilter.new
    @doc_type = SearchMissive::DocType.all
  end

  def search
    conditions = params[:search_missive_missive_filter]
    @missive_filter = SearchMissive::MissiveFilter.new(conditions)
    @result = @missive_filter.filter_out.page(params[:page])
  end

  def show
    @missive = SearchMissive::Missive.where(params[:id])
  end

end
