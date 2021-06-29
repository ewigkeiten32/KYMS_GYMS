class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :trainer, null: false, foreign_key: true
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
