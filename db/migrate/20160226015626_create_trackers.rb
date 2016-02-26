class CreateTrackers < ActiveRecord::Migration
  def change
    create_table :trackers do |t|
    	t.integer :number
    end
  end
end
