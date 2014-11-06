class CreateFollowersTable < ActiveRecord::Migration
  def change
  	create_table :followers do |t|
  		t.integer :follower
  		t.integer :following
  	end
  end
end
