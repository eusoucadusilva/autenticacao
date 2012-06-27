class CreateProfiles < ActiveRecord::Migration
  def up

  	create_table :profiles do |t|

  		t.integer :user_id
  		t.string  :name
  		t.timestamps
	end

  end

  def down

  	drop_table :profiles

  end
end
