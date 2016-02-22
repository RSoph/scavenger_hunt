class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
    	t.integer :number
    	t.text :text
    	t.string :answer
     	t.timestamps null: false
    end
  end
end
