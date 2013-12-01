class CreateSearchMissiveAcceptDates < ActiveRecord::Migration
  def change
    create_table :search_missive_accept_dates do |t|
      t.date :date, :null => false
      t.timestamps
    end
  end
end
