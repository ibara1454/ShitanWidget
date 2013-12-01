class SearchMissive::Missive < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :accept_date, :doc_type, :agency, :initial, :reference_no, :subject, :document

  has_many :attachments

  belongs_to :accept_date
  belongs_to :doc_type
  belongs_to :agency
  belongs_to :initial
  belongs_to :document
end
