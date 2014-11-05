class CreateProfileTable < ActiveRecord::Migration
  def change
  	create_table :profiles do |t|
  		t.string :text
  		t.integer :user_id
  	end
  end
end
