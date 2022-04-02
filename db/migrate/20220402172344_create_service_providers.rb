class CreateServiceProviders < ActiveRecord::Migration[7.0]
  def change
    create_table :service_providers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :service
      t.string :password_digest
      t.text :address
      t.string :working_hours
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
