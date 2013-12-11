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
    @missive = SearchMissive::Missive.includes(:accept_date, :doc_type, :agency, :initial, :document, :attachments).find(params[:id])
    render(:layout => false) if request.xml_http_request?
  end

  def download
    file = case params[:type]
    when 'document'
      SearchMissive::Document.find(params[:id])
    when 'attachment'
      SearchMissive::Attachment.find(params[:id])
    else
      raise ActionController::RoutingError.new('404 Not Found')
    end
    file_path = Rails.root.join('tmp/files/attach', file.path)
    send_file(file_path)
  end
end
