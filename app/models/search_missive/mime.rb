class SearchMissive::Mime < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name

  has_many :documents
  has_many :attachments
end
