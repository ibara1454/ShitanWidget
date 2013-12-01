class CreateSearchMissiveAgencies < ActiveRecord::Migration
  def change
    create_table :search_missive_agencies do |t|
      t.string :name, :null => false
      t.timestamps
    end
  end
end
