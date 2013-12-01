class CreateSearchMissiveInitials < ActiveRecord::Migration
  def change
    create_table :search_missive_initials do |t|
      t.string :name, :null => false
      t.timestamps
    end
  end
end
