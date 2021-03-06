class CreateConsumers < ActiveRecord::Migration[7.0]
  def change
    create_table :consumers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.text :address
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
