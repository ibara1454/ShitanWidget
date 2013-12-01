class CreateSearchMissiveDocuments < ActiveRecord::Migration
  def change
    create_table :search_missive_documents do |t|
      t.string :path, :null => false

      t.references :mime, :null => false

      t.timestamps
    end
  end
end
