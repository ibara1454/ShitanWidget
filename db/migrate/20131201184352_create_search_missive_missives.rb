class CreateSearchMissiveMissives < ActiveRecord::Migration
  def change
    create_table :search_missive_missives do |t|
      t.string :reference_no, :null => false
      t.text :subject, :null => false

      t.references :accept_date, :null => false
      t.references :doc_type, :null => false
      t.references :agency, :null => false
      t.references :initial, :null => false
      t.references :document, :null => false

      t.timestamps
    end
  end
end
