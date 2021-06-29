class CreateTrainers < ActiveRecord::Migration[6.0]
  def change
    create_table :trainers do |t|
      t.string :discipline
      t.string :level
      t.integer :price

      t.timestamps
    end
  end
end
