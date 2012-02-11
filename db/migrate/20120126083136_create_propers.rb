class CreatePropers < ActiveRecord::Migration
  def self.up
    create_table :propers do |t|
      t.string :flat_no
      t.string :building_name
      t.integer :plot
      t.integer :sector
      t.string :area
      t.integer :pincode
      t.text :description
      t.string :area_sqft
      t.integer :cost
      t.string :property_type
      t.string :property_for
      t.string :utilities
      t.string :amneties
      t.string :email
      t.integer :user_id
      t.string :property_level

      t.timestamps
    end
    add_index :propers, :email
    add_index :propers, :user_id
  end
  
  def self.down
  	drop_table :propers
  end
end
