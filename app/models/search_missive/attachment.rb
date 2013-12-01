class SearchMissive::Attachment < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :path, :mime, :missive
  belongs_to :missive
  belongs_to :mime
end
