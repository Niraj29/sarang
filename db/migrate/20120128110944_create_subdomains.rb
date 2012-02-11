class CreateSubdomains < ActiveRecord::Migration
  def self.up
    create_table :subdomains do |t|
      t.string :name
      t.references :user

      t.timestamps
    end
    add_index :subdomains, :user_id
  end
  
  def self.down
  	drop_table :subdomains
  end
end
