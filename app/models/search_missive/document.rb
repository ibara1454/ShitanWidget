class SearchMissive::Document < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :path, :mime

  has_one :missive
  belongs_to :mime
end
