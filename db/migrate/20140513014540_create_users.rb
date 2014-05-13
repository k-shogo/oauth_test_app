class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :doorkeeper_uid
      t.string  :doorkeeper_access_token
      t.string  :email

      t.timestamps
    end
  end
end
