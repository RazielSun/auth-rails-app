class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :name
    	t.string :email
    	t.string :password_digest
    	t.string :token_digest
    	t.datetime :token_expiry

    	t.timestamps null: false
    end
  end
end
