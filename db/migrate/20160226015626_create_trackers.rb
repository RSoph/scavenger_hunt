class CreateTrackers < ActiveRecord::Migration
  def change
    create_table :trackers do |t|
<<<<<<< HEAD
    	t.integer :number
=======
    	t.integer :count
>>>>>>> 2c6170b... tweaking how tracker works
    end
  end
end
