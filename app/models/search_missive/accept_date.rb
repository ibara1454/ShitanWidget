class SearchMissive::AcceptDate < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :date
  has_many :missives
end
