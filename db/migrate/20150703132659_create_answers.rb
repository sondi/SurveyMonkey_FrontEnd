class CreateAnswers < ActiveRecord::Migration
  def change
  	create_table :answers do  |t|
  		t.integer :choices_id
  		t.integer :participations_id

  		t.timestamps
  	end
  end
end
