class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :address_line1
      t.string :adress_line_2, :null => true
      t.string :city
      t.string :postal_code
      t.string :country
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
