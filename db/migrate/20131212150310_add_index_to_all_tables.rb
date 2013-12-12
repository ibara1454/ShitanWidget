class AddIndexToAllTables < ActiveRecord::Migration
  def change
    add_index :search_missive_attachments, :id
    add_index :search_missive_attachments, :missive_id
    add_index :search_missive_documents, :id
    add_index :search_missive_accept_dates, :id
    add_index :search_missive_accept_dates, :date
    add_index :search_missive_agencies, :id
    add_index :search_missive_initials, :id
    add_index :search_missive_missives, :id
    add_index :search_missive_missives, :accept_date_id
    add_index :search_missive_missives, :agency_id
    add_index :search_missive_missives, :initial_id
    add_index :search_missive_missives, :document_id
  end
end
