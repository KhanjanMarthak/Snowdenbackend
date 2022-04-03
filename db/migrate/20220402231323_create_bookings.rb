class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :booking_date
      t.integer :status
      t.references :consumer, foreign_key: true
      t.references :service_provider, foreign_key: true

      t.timestamps
    end
  end
end
