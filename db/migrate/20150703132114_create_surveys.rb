class CreateSurveys < ActiveRecord::Migration
  def change
  	create_table :surveys do  |t|
  		t.integer :author_id
  		t.string :name

  		t.timestamps
  	end
  end
end
