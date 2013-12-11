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
    @missive = SearchMissive::Missive.find(params[:id])
    render(:layout => false) if request.xml_http_request?
  end

  def download
    file_path = Rails.root.join('tmp/files/attach', params[:path])
    send_file(file_path)
  end

  # routing not foundの時の対策
  def notfound
    render :file => Rails.root.join('public', '404.html')
  end

end
