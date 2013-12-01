class CreateSearchMissiveAttachments < ActiveRecord::Migration
  def change
    create_table :search_missive_attachments do |t|
      t.string :path, :null => false

      t.references :mime, :null => false
      t.references :missive, :null => false

      t.timestamps
    end
  end
end
