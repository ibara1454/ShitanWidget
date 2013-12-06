class SearchMissiveController < ApplicationController

  def index
    @obj = MissiveFilter.new
  end

  def search
    #@obj = MissiveFilter.new(params[:obj])
    #render
  end

end
